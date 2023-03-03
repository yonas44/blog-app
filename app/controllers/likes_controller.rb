class LikesController < ApplicationController
  def create
    post = Post.find_by(id: params[:post_id])
    user = User.find_by(id: params[:user_id])
    @like = Like.new(author: user, post:)

    if @like.save
      flash[:success] = 'Likes added successfully'
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      flash.now[:error] = 'Error occured'
    end
  end
end
