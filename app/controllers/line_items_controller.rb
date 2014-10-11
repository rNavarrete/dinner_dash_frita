class LineItemsController < ApplicationController
  # before_action :cart, only: [:create]

  def create
    cart.add_line_item(params[:id], params[:quantity][:quantity])
    gflash :now, :success => "#{params[:quantity][:quantity]} #{find_item(params[:id]).title}".pluralize + " sucessfully added to your cart!"
    redirect_to root_path
   end

  def update
    update_item(params[:id], params[:quantity])
    gflash :now, :success => "#{find_item(params[:id]).title} has been successfully updated."
    redirect_to cart_path
  end

  def destroy
    delete_item(params[:id])
    gflash :now, :notice => "#{find_item(params[:id]).title} has been successfully deleted."
    redirect_to cart_path
  end

  private

  # def set_cart
  #   @cart = Cart.find_by_id(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end
end
