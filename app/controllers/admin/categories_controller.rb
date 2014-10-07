class Admin::CategoriesController < Admin::AdminController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category Successfully Created"
      redirect_to admin_path
    else
      flash[:errors] = @category.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated."
      redirect_to admin_path
    else
      flash[:error] = "Category was not updated. Please try again."
      render :new
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
