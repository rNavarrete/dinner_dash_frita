class PagesController < ApplicationController
  def index
  end

  def menu
    @categories = Category.all
    @user = User.new
  end
end
