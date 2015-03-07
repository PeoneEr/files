class MainPageController < ApplicationController
  def index
    if request.xhr?
      Film.find(params[:id]).delay.update_attribute(:watched, params[:watched])
      render nothing: true, status: 202
    else
      @files = Film.order('watched, title').group_by(&:dir)
    end
  end
end
