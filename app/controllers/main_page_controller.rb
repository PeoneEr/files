class MainPageController < ApplicationController
  before_filter :authenticate_user!

  def index
    if request.xhr?
      if UserFilm.where(user_id: current_user.id, film_id: params[:id]).any?
        UserFilm.where(user_id: current_user.id, film_id: params[:id]).first.update_attribute(:watched, params[:watched])
      end
      render nothing: true, status: 202
    else
      @dirs = Film.all.sort.map(&:dir).uniq
    end
  end
end
