class AdminMagic::CategoriesController < AdminMagic::BaseController
  before_action :find_category, only:[:show,:edit,:update,:destroy]

  def index
    @categories = Category.all

    # 如果有分页
    # @all = @all.page(params[:page]).per(page_count)
  end


  def new

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_magic_categories_path
      flash[:success] = "新增成功"
    else
      render :new
      flash[:error] = @category.errors.full_messages.join(",")
    end
  end

  def show

  end

  def edit

  end

  def update
    @category.attributes = category_params
    if @category.save
      redirect_to admin_magic_categories_path
      flash[:success] = "更新成功"
    else
      render :edit
      flash[:error] = @category.errors.full_messages.join(",")
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_magic_categories_path
      flash[:success] = "删除成功"
    else
      flash[:error] = "删除失败"
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit!
  end
end
