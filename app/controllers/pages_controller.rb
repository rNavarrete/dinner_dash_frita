class PagesController < ApplicationController
  def index
  end

  def menu
    @categories = Category.all
    @user = User.new
  end

  def admin
    @categories = Category.all
  end
end
