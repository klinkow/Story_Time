class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end
  def new
    @user = User.new
    render :new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      alert("try again")
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
