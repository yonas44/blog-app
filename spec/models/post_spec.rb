require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Yonas', photo: 'Photo here', bio: 'bio here', posts_counter: 0) }

  let(:post1) { Post.create(author: user, title: 'This is my first post', text: 'This is text') }
  let(:post2) { Post.create(author: user, title: 'This is another post', text: 'This is text', comments_counter: -1) }

  let(:comment) { Comment.create(author: user, post: post1, text: 'This is my comment!') }

  it 'increments likes_counter' do
    post1.increment_likes_counter(true)
    expect(post1.likes_counter).to eq 1
  end

  it 'rejects negative comments_counter' do
    expect(post2).to be_invalid
  end

  it 'increments comments_counter' do
    post1.increment_comments_counter
    expect(post1.comments_counter).to eq 1
  end

  it 'should return three recent posts' do
    recent_comments = post1.most_recent_comments
    expect(recent_comments.length).to eq 0
  end
end
