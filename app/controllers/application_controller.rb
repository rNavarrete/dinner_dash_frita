class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersHelper

  helper_method :cart
  helper_method :find_item
  helper_method :address_delivered_to
  helper_method :order_items
  helper_method :past_order_quantity
  helper_method :past_order_total

  def cart
  	@cart ||= Cart.new(session)
  end

  def find_item(item_id)
  	Item.find(item_id)
  end

   # refactor this shit
   def order_items(line_items_hash)
   		items = {}
   		line_items_array = line_items_hash.to_a
   		line_items_array.each do |id_and_item_array|
   			item_id = id_and_item_array[0].scan(/\d+/)
   			quantity = id_and_item_array[1].to_i
   			items[item_id[0]] = quantity
   		end
   		items
   end

   def past_order_quantity(line_items_hash)
   		order_items(line_items_hash).values.reduce(0) {|sum, quantity| sum += quantity}
   end

   def past_order_total(line_items_hash)
 		total = 0
   		order_items(line_items_hash).each do |item_id, quantity|
    		total += find_item(item_id).price * quantity
    	end
    total
  end
end
