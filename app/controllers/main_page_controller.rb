class MainPageController < ApplicationController
  before_filter :authenticate_user!
  helper_method :page, :per_page

  def index
    @dirs = FilmDir.search { paginate page: page, per_page: per_page }.results
  end

  def page
    params[:page] || 1
  end

  def per_page
    1000000
  end
end
