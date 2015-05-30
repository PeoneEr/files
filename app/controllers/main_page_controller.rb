class MainPageController < ApplicationController
  before_filter :authenticate_user!
  helper_method :page

  def index
    @dirs = Film.search { paginate page: page, per_page: per_page }.results.to_a.sort.map(&:dir).uniq
  end

  def page
    params[:page] || 1
  end

  def per_page
    10
  end
end
