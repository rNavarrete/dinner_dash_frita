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

  def cart
    if line_items.empty?
      redirect_to root_path
      flash[:notice] = "Your cart is currently empty. You should fill it with Mojitos."
    end
  end
end
