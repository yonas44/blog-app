class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id]).page params[:page] || 'There are no posts with this id.'
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || 'There is no post'
  end
end
