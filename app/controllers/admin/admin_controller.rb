class Admin::AdminController < ApplicationController
  before_filter :verify_admin

  def verify_admin
    redirect_to root_path unless User.find(session[:user_id]).admin?
  end
end
