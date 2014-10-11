class OrdersController < ApplicationController

  def new
    @user = User.new
    @order = Order.new
    @line_items = line_items
    @address = Address.find(params[:address]) if params[:address]
  end

  def create
    binding.pry
  end
end
