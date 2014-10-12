class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) && user.admin?
      session[:user_id] = user.id
      gflash :now, :success => 'Successfully Logged In'
      # NormalizeUserCart.call(user, session)
      redirect_to admin_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # fix_cart_shit(user)
      gflash :now, :success  => 'Successfully Logged In'
      redirect_to root_path
    else
      gflash :now, :error => 'Invalid login. Please try again.'
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    gflash :now, :success => 'Successfully Logged Out.'
    redirect_to root_path
  end
end
