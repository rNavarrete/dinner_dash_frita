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
end
