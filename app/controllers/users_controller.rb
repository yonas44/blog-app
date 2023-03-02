class UsersController < ApplicationController
  layout 'standard'
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts).find_by(id: params[:id]) || 'There is no user'
  end
end
