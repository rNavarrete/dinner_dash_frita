class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    if current_user.nil? || current_user.id != params[:id].to_i
        redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # flash[:notice]    = 'Account Successfully Created'
      gflash :now, :success => "Awesome! Account Created"

      redirect_to root_path
    else
      # flash[:errors] = @user.errors.full_messages.to_sentence
      gflash :now, :error =>  @user.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def orders
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user.nil? || current_user.id != params[:id].to_i
        redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      gflash :now, :success => 'Account Successfully Updated'
    else
      gflash :now, :error => user.errors.full_messages.to_sentence
    end
    redirect_to user_path
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      session.clear
      gflash :now, :success  => "Successfully Deleted #{user.name.capitalize}"
      redirect_to root_path
    else
      gflash :now, :error => @user.errors.full_messages.to_sentence
      redirect_to user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
