class MainPageController < ApplicationController
  def index
    @files = Film.all
  end
end
