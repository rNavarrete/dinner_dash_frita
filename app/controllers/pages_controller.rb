class PagesController < ApplicationController
  include PagesHelper

  before_filter :verify_admin, only: [:admin]

  def index
  end

  def menu
    @categories = Category.all
    @user = User.new
  end

  def admin
    @categories = Category.all
    @users = User.all
  end

  def about
    @user = User.new
  end

  def code
    redirect_to 'http://github.com/rNavarrete/dinner_dash_frita'
  end

  def cart_route
    @user = User.new
    if cart.line_items.empty?
      redirect_to root_path
      gflash :now, :notice => "Your cart is currently empty. You should fill it with Mojitos."
    else
      render 'cart'
    end
  end
end
