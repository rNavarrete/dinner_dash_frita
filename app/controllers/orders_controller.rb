class OrdersController < ApplicationController

  def new
    @user = User.new
    @order = Order.new
    @line_items = line_items
  end
end
