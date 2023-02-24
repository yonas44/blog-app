require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user1 = User.create(name: 'Yonas', photo: 'Photo here', bio: 'bio here', posts_counter: 0)

    @post1 = Post.create(author: @user1, title: 'This is my first post', text: 'This is text')

    @comment = Comment.create(author: @user1, post: @post1, text: 'This is my comment!')
  end

  it 'invokes a method to increment comments_counter in a post' do
    @comment.update_post_comments_counter
    expect(@post1.comments_counter).to eq 2
  end
end
