class UsersController < ApplicationController

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
      flash[:notice]    = 'Account Successfully Created'
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def orders
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      flash[:notice]    = 'Account Successfully Updated'
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
    end
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
