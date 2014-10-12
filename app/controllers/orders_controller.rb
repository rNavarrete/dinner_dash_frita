class OrdersController < ApplicationController

  def new
    @user = User.new
    @order = Order.new(pickup_or_delivery: params[:pickup_option])
    @line_items = line_items
    @address = Address.find_by(user_id: current_user.id)
    @pickup_option = params[:pickup_option]
  end

  def create
    @order = Order.create(order_params)
    redirect_to order_path(@order.id)
  end

  def show
    @order = Order.find_by(id: params[:id])
    @address = Address.find_by(id: @order.address)

  end

  private

  def order_params
    params.require(:order).permit(:user_id, :address, :status, :pickup_or_delivery, :line_items)
  end

  # def on_file?
  #   @address.find_by(user_id: current_user.id)
  # end
end
