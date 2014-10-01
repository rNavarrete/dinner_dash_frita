class PagesController < ApplicationController
  def index

  end

  def menu
    @categories = Category.all
  end
end
