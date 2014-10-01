class PagesController < ApplicationController
  def index

  end

  def menu
    @items = Item.all
  end
end
