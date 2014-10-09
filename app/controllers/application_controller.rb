class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersHelper

  helper_method :cart
  helper_method :find_item
  helper_method :total_quantity
  helper_method :subtotal

   def cart
     @cart ||= Cart.new(session)
   end

   def find_item(item_id)
     Item.find(item_id)
   end

   def total_quantity
     session[:cart_items].values.reduce(0) {|sum, quantity| sum += quantity.to_i }
   end

   def subtotal
     session[:cart_items].keys.reduce(0) { |sum, item_id| sum += find_item(item_id).price }
   end



end
