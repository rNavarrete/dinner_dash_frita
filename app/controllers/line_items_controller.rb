class LineItemsController < ApplicationController
  # before_action :set_cart, only: [:create]
  before_action :cart, only: [:create]
  # before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def create
    item = Item.find(params[:id])
    if current_user
      @line_item = cart.line_items.create(item: item, quantity: params[:quantity][:quantity])
      if @line_item.save
        flash[:notice] = "#{params[:quantity][:quantity]} " +  "#{item.title}".pluralize +  " successfully added to cart."
        redirect_to root_path
      end
    else
      puts "hello"

      session[:cart_items] << [params[:id], params[:quantity][:quantity] ]

      flash[:notice] = "#{params[:quantity][:quantity]} " +  "#{item.title}".pluralize +  " successfully added to cart. #{session[:cart_items]}"
      redirect_to :back
    end
   end

  private

  def set_cart
    @cart = Cart.find_by_id(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
