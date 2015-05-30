class My::FilesController < My::ApplicationController
  before_filter :authenticate_user!

  helper_method :title, :dir, :serias_count

  def index
    @files = Film.search { fulltext params[:q] { fields(:dir) }; order_by(:title); with :user_id, current_user.id; paginate page: 1, per_page: 1_000 }.results.group_by(&:dir)
  end

  def destroy
    current_user.user_films.where(dir: params[:id]).destroy_all
    redirect_to my_root_path
  end

  def new_film
    @film = Film.new
  end

  def create_film
    @film = Film.new(title: title, dir: title)
    if @film.save(validate: false)
      @film.user_films.create(user_id: current_user.id, film_id: @film.id, dir: @film.dir)
      redirect_to my_root_path
    else
      render 'new_film'
    end
  end

  def new_serial
    @film = Film.new
  end

  def create_serial
    serias_count.times do |i|
      f = Film.new(dir: dir, title: "Серия №#{i+1}")
      f.save(validate: false)
    end

    Film.where(dir: dir).each do |film|
      film.user_films.create(user_id: current_user.id, film_id: film.id, dir: dir)
    end

    redirect_to my_root_path
  end

  def start_watching
    Film.where(dir: params[:dir]).each do |film|
      film.user_films.create!(user_id: current_user.id, film_id: film.id, dir: params[:dir])
    end

    redirect_to my_root_path
  end

  def title
    params[:film].try(:[], :title)
  end

  def dir
    params[:film].try(:[], :dir)
  end

  def serias_count
    params[:film].try(:[], :serias_count).to_i
  end

  def change_watched
    if request.xhr?
      current_user.user_films.search { with :film_id, params[:id] }.results.first.update_attribute :watched, params[:watched]
      render nothing: true, status: 202 and return
    end
  end
end
