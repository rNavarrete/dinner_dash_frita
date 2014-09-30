class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
   @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      flash[:notice] = @item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:notice] = "Item was successfully updated."
      redirect_to items_path
    else
      flash[:error] = "Item was not updated. Please try again."
      render :new
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :price, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :available)
  end
end
