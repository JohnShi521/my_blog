class HomeController < ApplicationController
  layout("home_application")
  def index
    @articles =Article.all
  end

  def detail
    @article = Article.find_by_id(params[:id])
  end
end
