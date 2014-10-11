require 'money'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersHelper

  helper_method :cart
  helper_method :find_item
  helper_method :total_quantity
  helper_method :subtotal
  helper_method :line_items
  helper_method :line_item_total
  helper_method :delete_item
  helper_method :update_item
  helper_method :valid_state_code
  helper_method :stripe_total

  def cart
    @cart ||= Cart.new(session)
  end

  def line_items
    session[:cart_items] ||= {}
  end

  def find_item(item_id)
    Item.find(item_id)
  end

  def total_quantity
    line_items.values.reduce(0) {|sum, quantity| sum += quantity.to_i }
  end

  def line_item_total(item_id, quantity)
    find_item(item_id).price.to_i * quantity.to_i
  end

  def subtotal
    # session[:cart_items].keys.reduce(0) { |sum, item_id| sum += find_item(item_id).price }
    sum = 0
    line_items.each do |item_id, quantity|
      sum += find_item(item_id).price.to_i * quantity.to_i
    end
      sum
  end

  def stripe_total(amount)
      Money.new((amount * 100) , "USD").cents
  end

  def update_item(item_id, quantity)
      line_items[item_id] = quantity
  end

  def delete_item(item_id)
    line_items.delete(item_id)
  end

  def valid_state_code
    %w(AK AL AR AS AZ CA CO CT DC DE FL GA GU HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA PR RI SC SD TN TX UT VA VI VT WA WI WV WY)
  end

end
