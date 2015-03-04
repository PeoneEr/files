class MainPageController < ApplicationController
  def index
    if request.xhr?
      Film.find(params[:id]).update_attribute(:watched, true)
      render nothing: true, status: 202
    else
      @files = Film.order('updated_at desc').group_by(&:dir)
    end
  end
end
