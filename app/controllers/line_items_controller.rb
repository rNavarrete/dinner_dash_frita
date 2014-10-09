class LineItemsController < ApplicationController
  # before_action :cart, only: [:create]



  def create
    cart.add_line_item(params[:id], params[:quantity][:quantity])
    flash[:notice] = "#{cart.line_items}"
    redirect_to root_path
    # item = Item.find(params[:id])
    # cart.add_line_item(params[:id], params[:quantity][:quantity])
    # line_item = LineItem.create(item_id: item.id, quantity: params[:quantity][:quantity])
    # cart.items.merge!(line_item: line_item)

    # session[:cart_items] << [item, params[:quantity][:quantity] ]
    # flash[:notice] = "#{params[:quantity][:quantity]} " +  "#{item.title}".pluralize +  " successfully added to cart. #{session[:cart_items]}"
    # redirect_to :back
   end

  private

  # def set_cart
  #   @cart = Cart.find_by_id(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end
end
