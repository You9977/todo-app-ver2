class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the ToDo App!"
      redirect_to tasks_url(current_user)
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
