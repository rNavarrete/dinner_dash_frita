class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = 'Successfully Created'
        redirect_to @user
      end
    else
      flash[:errors] = 'Please Try Again'
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
