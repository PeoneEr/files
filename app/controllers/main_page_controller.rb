class MainPageController < ApplicationController
  before_filter :authenticate_user!

  def index
    if request.xhr?
      if UserFilm.where(user_id: current_user.id, film_id: params[:id]).any?
        UserFilm.where(user_id: current_user.id, film_id: params[:id]).first.delay.update_attribute(:watched, params[:watched])
      else
        UserFilm.create(user_id: current_user.id, film_id: params[:id], watched: params[:watched])
      end
      render nothing: true, status: 202
    else
      @files = Film.order('watched, title').group_by(&:dir)
    end
  end
end
