class AdminMagic::TagsController < AdminMagic::BaseController
  before_action :find_tag, only:[:show,:edit,:update,:destroy]

  def index
    @tags = Tag.all

    # 如果有分页
    # @all = @all.page(params[:page]).per(page_count)
  end


  def new

  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_magic_tags_path
      flash[:success] = "新增成功"
    else
      render :new
      flash[:error] = @tag.errors.full_messages.join(",")
    end
  end

  def show

  end

  def edit

  end

  def update
    @tag.attributes = tag_params
    if @tag.save
      redirect_to admin_magic_tags_path
      flash[:success] = "更新成功"
    else
      render :edit
      flash[:error] = @tag.errors.full_messages.join(",")
    end
  end

  def destroy
    if @tag.destroy
      redirect_to admin_magic_tags_path
      flash[:success] = "删除成功"
    else
      flash[:error] = "删除失败"
    end
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit!
  end

end
