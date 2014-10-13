class OrdersController < ApplicationController
  before_filter :active_orders, only: [:index]

  def index
    @recent_orders = active_orders
    @paid_orders = paid_orders
    @cancelled_orders = cancelled_orders
  end

  def new
    @user = User.new
    @order = Order.new(pickup_or_delivery: params[:pickup_option])
    @line_items = line_items
    @address = Address.find_by(user_id: current_user.id)
    @pickup_option = params[:pickup_option]
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      session[:cart_items] = {}
      gflash :now, :success => "Thank you. Your order has been successfully created."

      redirect_to order_path(@order.id)
    else
      gflash :now, :error =>  @order.errors.full_messages.to_sentence
      redirect_to :back
     end
  end

  def show
    @order = Order.find_by(id: params[:id])
    @address = Address.find_by(id: @order.address)
  end

  def order_params
    params.require(:order).permit(:user_id, :address, :status, :pickup_or_delivery, :line_items)
  end


  def paid_orders
    Order.all.where(status: "paid")
  end

  def cancelled_orders
    Order.all.where(status: "cancelled")
  end

  def active_orders
    return Order.all.where(status: "active")
  end
end
