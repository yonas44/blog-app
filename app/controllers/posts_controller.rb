class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).page params[:page]
  end

  def show
    @comment = Comment.new
    @post = Post.includes(:author, :comments, :likes).find_by(author_id: params[:user_id],
                                                              id: params[:id]) || 'There is no post'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author: current_user, title: post_params[:title], text: post_params[:text])
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(current_user)
    else
      flash[:success] = "Invalid input, post wasn't saved"
      redirect_to new_user_post_path(current_user)
    end
  end

  def destroy
    post = Post.find_by(author_id: current_user.id)
    post.author.decrement!(:posts_counter)
    post.destroy

    flash[:success] = 'Post removed successfully'
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
