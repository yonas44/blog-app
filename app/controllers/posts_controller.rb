class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).page params[:page] || 'There are no posts with this id.'
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || 'There is no post'
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to users_path
    else
      render :new, alert: 'Error occured!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
