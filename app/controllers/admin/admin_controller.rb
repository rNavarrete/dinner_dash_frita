class Admin::AdminController < ApplicationController
  before_filter :verify_admin

  def verify_admin
    session[:user_id] ? User.find(session[:user_id]).admin? : false
  end
end
