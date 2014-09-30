class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Succeffuly Logged In'
      redirect_to user_path(user)
    else
      flash[:errors] = 'Invalid login'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = 'Successfuly Logged Out.'
    redirect_to root_path
  end
end
