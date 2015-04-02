class My::FilesController < My::ApplicationController
  before_filter :authenticate_user!

  helper_method :title, :dir, :serias_count

  def index
  end

  def new_film
    @film = Film.new
  end

  def create_film
    @film = Film.new(title: title, dir: title)
    if @film.save
      redirect_to root_path
    else
      render 'new_film'
    end
  end

  def new_serial
    @film = Film.new
  end

  def create_serial
    serias_count.times do |i|
      Film.create(dir: dir, title: "Серия №#{i+1}")
    end

    redirect_to root_path
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
end
