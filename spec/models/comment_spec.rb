require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Yonas', photo: 'Photo here', bio: 'bio here', posts_counter: 0) }

  let(:post) { Post.create(author: user, title: 'This is my first post', text: 'This is text') }

  let(:comment) { Comment.create(author: user, post:, text: 'This is my comment!') }

  it 'invokes a method to increment comments_counter in a post' do
    comment.update_post_comments_counter
    expect(post.comments_counter).to eq 2
  end
end
