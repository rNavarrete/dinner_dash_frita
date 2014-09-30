class UsersController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to '/'
    elsif admin?
      @users = User.all
    else
      redirect_to "/users/#{session[:user_id]}"
    end
  end
end
