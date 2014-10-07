class Admin::ItemsController < Admin::AdminController
  def index
    @categories = Category.all
    @items      = Item.all
  end

  def new
    @item       = Item.new
    @categories = Category.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item Successfully Created"
      ItemCategory.create(item_id: @item.id, category_id: params[:item][:categories][1])
      redirect_to admin_path
    else
      flash[:errors] = @item.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @item  = Item.find(params[:id])

    if @item.update(item_params)
      flash[:notice] = "Item was successfully updated."
      redirect_to admin_path
    else
      flash[:error]  = "Item was not updated. Please try again."
      render :new
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to admin_path
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
end
