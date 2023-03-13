require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Yonas', photo: 'Photo here', bio: 'bio here', email: "test3@gmail.com", password: '123123') }

  let(:post) { Post.create(author: user, title: 'This is my first post', text: 'This is text') }

  let(:like) { Like.create(author: user, post:) }

  it 'invokes a method to increment likes_counter in a post' do
    like.update_post_likes_counter(true)
    expect(post.likes_counter).to eq 2
  end
end
