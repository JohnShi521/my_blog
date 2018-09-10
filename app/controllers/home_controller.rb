class HomeController < ApplicationController
  layout("home_application")
  before_action :pre_find
  def index
    @articles =Article.is_show_home
    @articles =@articles.where(category_id:params[:category_id]) if params[:category_id].present?
    @articles = @articles.joins(:tags).where("tags.id = ?", "#{params[:tag_id]}") if params[:tag_id].present?
    @articles = @articles.where(create_time: params[:create_time].to_time) if params[:create_time].present?

    case params[:type]
    when "technical"
      @articles = @articles.where(type:"Articles::Technical").order("created_at desc").page(params[:page]).per(10)
    when "life"
      @articles = @articles.where(type:"Articles::Life").order("created_at desc").page(params[:page]).per(10)
    else
      @articles = @articles.order("created_at desc").page(params[:page]).per(10)
    end

  end

  def detail
    real_ip =  real_ip(request)
    @article = Article.find_by_id(params[:id])
    @article.view_records.find_or_create_by(create_time:Time.now.beginning_of_day,real_ip:real_ip)
  end

  private
  def pre_find
    @new_articles = Article.is_show_home.order("created_at desc").limit(5)
    @categories = Category.all
    @time_file = Article.is_show_home.group_by{|o|o.create_time}
    @tags = Tag.all
  end
end
