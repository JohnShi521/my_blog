class AdminMagic::ArticlesController < AdminMagic::BaseController

  before_action :find_article, only:[:show,:edit,:update,:destroy]

  def index
    @articles = Article.all

    # 如果有分页
    # @all = @all.page(params[:page]).per(page_count)
  end


  def new

  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    tag_ids = params[:tag_ids]
    tags = Tag.where(id:tag_ids)
    if @article.save
      @article.tags = tags
      redirect_to admin_magic_articles_path
      flash[:success] = "新增成功"
    else
      Rails.logger.info @article.errors.full_messages.join(",")
      render :new
      flash[:error] = @article.errors.full_messages.join(",")
    end
  end

  def show

  end

  def edit

  end

  def update
    @article.attributes = article_params
    tag_ids = params[:tag_ids]
    tags = Tag.where(id:tag_ids)
    if @article.save
      @article.tags = tags
      redirect_to admin_magic_articles_path
      flash[:success] = "更新成功"
    else
      render :edit
      flash[:error] = @article.errors.full_messages.join(",")
    end
  end

  def destroy
    if @article.destroy
      redirect_to admin_magic_articles_path
      flash[:success] = "删除成功"
    else
      flash[:error] = "删除失败"
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit!
  end

end
