class ItemCategoriesController < ApplicationController

  def index
    @item_categories = ItemCategory.all
  end

  def show
   @item_category = ItemCategory.find(params[:id])
  end

  def new
    @item_category = ItemCategory.new
    @categories      = Category.all
    @items           = Item.all
  end

  def edit
    @item_category = ItemCategory.find(params[:id])
  end

  def create
    @item_category = ItemCategory.new(item_category_params)
    if @item_category.save
      flash[:notice] = "ItemCategory Successfully Created"
      redirect_to item_categories_path
    else
      flash[:errors] = @item_category.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @item_category = ItemCategory.find(params[:id])

    if @item_category.update(item_category_params)
      flash[:notice] = "ItemCategory was successfully updated."
      redirect_to item_categories_path
    else
      flash[:error] = "ItemCategory was not updated. Please try again."
      render :new
    end
  end

  def destroy
    ItemCategory.find(params[:id]).destroy
    redirect_to item_categories_path
  end

  private
  def item_category_params
    params.require(:item_category).permit(:item_id, :category_id)
  end
end
