require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @user1 = User.create(name: 'Yonas', photo: 'Photo here', bio: 'bio here', posts_counter: 0)

    @post1 = Post.create(author: @user1, title: 'This is my first post', text: 'This is text')
    @post2 = Post.create(author: @user1, title: 'This is another post', text: 'This is text', comments_counter: -1)

    Comment.create(author: @user1, post: @post1, text: 'This is my comment!')
  end

  it 'increments likes_counter' do
    @post1.increment_likes_counter(true)
    expect(@post1.likes_counter).to eq 1
  end

  it 'rejects negative comments_counter' do
    expect(@post2).to be_invalid
  end

  it 'increments comments_counter' do
    @post1.increment_comments_counter
    expect(@post1.comments_counter).to eq 2
  end

  it 'should return three recent posts' do
    recent_comments = @post1.most_recent_comments
    expect(recent_comments.length).to eq(1)
  end
end
