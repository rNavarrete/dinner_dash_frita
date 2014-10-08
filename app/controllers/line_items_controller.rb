class LineItemsController < ApplicationController
  # before_action :set_cart, only: [:create]
  before_action :cart, only: [:create]
  # before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
    item = Item.find(params[:id])

    @line_item = cart.line_items.create(item: item, quantity: params[:quantity][:quantity])
    params.inspect
    if @line_item.save
      flash[:notice] = "#{params[:quantity][:quantity]} " +  "#{item.title}".pluralize +  " successfully added to cart."
      redirect_to root_path
    else
      flash[:error] = "Item did not save. Please try again."
      redirect_to root_path
    end
  end

  private

  # def set_cart
  #   @cart = Cart.find_by_id(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end
end
