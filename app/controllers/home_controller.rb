class HomeController < ApplicationController
  layout("home_application")
  def index
    @articles =Article.is_show_home
    @new_articles = Article.is_show_home.order("created_at desc").limit(5)
    @categories = Category.all
    @time_file = Article.is_show_home.group_by{|o|o.create_time}
    @tags = Tag.all
  end

  def detail
    @article = Article.find_by_id(params[:id])
    @new_articles = Article.is_show_home.order("created_at desc").limit(5)
    @categories = Category.includes(:articles).all
    @time_file = Article.is_show_home.group_by{|o|o.create_time}
    @tags = Tag.includes(:articles).all
  end
end
