class HomeController < ApplicationController
  layout("home_application")
  before_action :pre_find
  def index
    @articles =Article.is_show_home
    case params[:type]
    when "technical"
      @articles = @articles.where(type:"Articles::Technical")
    when "life"
      @articles = @articles.where(type:"Articles::Life")
    else
      @articles = @articles
    end

  end

  def detail
    @article = Article.find_by_id(params[:id])
  end

  private
  def pre_find
    @new_articles = Article.is_show_home.order("created_at desc").limit(5)
    @categories = Category.all
    @time_file = Article.is_show_home.group_by{|o|o.create_time}
    @tags = Tag.all
  end
end
