class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id]) || 'There is no user'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User saved successfully'
      redirect_to users_path
    else
      flash.now[:error] = "Error: couldn't save user"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :photo)
  end
end
