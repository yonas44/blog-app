class CommentsController < ApplicationController
  layout 'standard'

  def new
    @comment = Comment.new
  end

  def create
    post = Post.find_by(id: params[:post_id])

    @comment = Comment.new(author: current_user, post:, text: comment_params)

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      flash.now[:error] = "Error: couldn't save comment"
      render :new, alert: 'Error occured!'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.post.decrement!(:comments_counter)
    comment.destroy

    flash[:success] = 'Comment deleted successfully'
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
