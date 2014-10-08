class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password]) && user.admin?
      session[:user_id] = user.id
      flash[:notice] = 'Successfully Logged In'
      # NormalizeUserCart.call(user, session)
      redirect_to admin_path
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id
      fix_cart_shit(user)
      flash[:notice] = 'Successfully Logged In'
      redirect_to root_path
    else
      flash[:errors] = 'Invalid login. Please try again.'
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'Successfully Logged Out.'
    redirect_to root_path
  end
end
