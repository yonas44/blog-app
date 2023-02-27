class PostsController < ApplicationController
  def index
    puts Post.where(author_id: params[:user_id])
  end

  def show
    puts Post.where(author_id: params[:user_id], id: params[:id])
  end
end
