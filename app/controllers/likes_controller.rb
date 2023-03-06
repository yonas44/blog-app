class LikesController < ApplicationController
  layout 'standard'

  def create
    post = Post.find_by(id: params[:post_id])
    user = current_user
    @like = Like.new(author: user, post:)

    if @like.save
      flash[:success] = 'Likes added successfully'
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      flash.now[:error] = 'Error occured'
    end
  end

  def destroy
    @like = Like.find_by(author_id: current_user.id).destroy

    flash[:success] = 'Likes removed successfully'
    redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
  end
end
