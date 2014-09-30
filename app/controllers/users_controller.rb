class UsersController < ApplicationController

  def index
    if session[:user_id].nil?
      redirect_to '/'
    elsif User.find(session[:user_id]).admin?
      @users = User.all
    else
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Account Successfully Created'
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
