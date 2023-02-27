class UsersController < ApplicationController
  def index
    puts User.all
  end

  def show
    puts User.where(id: params[:id])
  end
end
