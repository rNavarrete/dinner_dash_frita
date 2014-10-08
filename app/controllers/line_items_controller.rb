class LineItemsController < ApplicationController
  # before_action :set_cart, only: [:create]
  before_action :cart, only: [:create]
  # before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
    item = Item.find(params[:id])
    session[:cart_items] ||= []
    session[:cart_items] << [params[:id], params[:quantity][:quantity] ]
    flash[:notice] = "#{params[:quantity][:quantity]} " +  "#{item.title}".pluralize +  " successfully added to cart. #{session[:cart_items]}"

    redirect_to :back
   end

  private

  def set_cart
    @cart = Cart.find_by_id(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
