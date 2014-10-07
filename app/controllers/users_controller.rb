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

      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      redirect_to request.path
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
      flash[:notice] = 'Account Successfully Updated'
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
    end
    redirect_to user_path
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      session.clear
      flash[:notice]  = "Successfully Deleted #{user.name.capitalize}"
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages.to_sentence
      redirect_to user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
