class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include UsersHelper

  private
  def cart
    @cart ||= Cart.find_by_id(session[:cart_id]) || Cart::Null.new
  end

  helper_method :cart
end
