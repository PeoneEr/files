class My::FilesController < My::ApplicationController
  before_filter :authenticate_user!

  def index
    @dirs = FilmDir.search {
      paginate page: 1, per_page: 1_000_000;
      fulltext params[:q] { fields(:title) };
      with :user_id, current_user.id
    }.results
  end

  def destroy
    current_user.user_films.where(dir: params[:id]).destroy_all
    redirect_to my_root_path
  end

  def new_film
    @film = FilmDir.new
  end

  def create_film
    film_dir = FilmDir.create!(title: params[:film_dir][:title])

    film = film_dir.films.new(title: "Фильм")
    film.save(validate: false)
    film_dir.increment! :serias_count

    film_dir.films.each do |film|
      film.user_films.create(user_id: current_user.id, film_id: film.id, dir: film_dir.title)
    end

    redirect_to my_root_path
  end

  def new_serial
    @film = FilmDir.new
  end

  def create_serial
    film_dir = FilmDir.create!(title: params[:film_dir][:title])

    params[:film_dir][:serias_count].to_i.times do |i|
      film = film_dir.films.new(title: "Серия №#{i+1}")
      film.save(validate: false)
      film_dir.increment! :serias_count
    end

    film_dir.films.each do |film|
      film.user_films.create(user_id: current_user.id, film_id: film.id, dir: film_dir.title)
    end

    redirect_to my_root_path
  end

  def start_watching
    FilmDir.where(title: params[:dir]).first.films.each do |film|
      film.user_films.create!(user_id: current_user.id, film_id: film.id, dir: params[:dir])
    end

    redirect_to my_root_path
  end

  def change_watched
    if request.xhr?
      current_user.user_films.search { with :film_id, params[:id] }.results.first.update_attribute :watched, params[:watched]
      render nothing: true, status: 200 and return
    end
  end
end
