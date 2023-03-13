require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Yonas', bio: 'bio here', photo: 'Photo here', email: "test3@gmail.com", password: '123123') }
  let(:post) { Post.create(author: user, title: 'Post title', text: 'Post text') }

  describe 'GET #index' do
    before(:example) { get '/users/1/posts' }
    it 'returns successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'assigns an instance variable accessable from the view' do
      expect(assigns(:posts).length).to eq(Post.where(author_id: 1).length || 'There is no user')
    end
    it 'renders the correct template' do
      expect(response).to render_template('index')
    end
    it 'has the correct response body text' do
      expect(response.body).to include('My first post')
    end
  end

  describe 'GET #show' do
    before(:example) { get "/users/#{user.id}/posts/#{post.id}" }
    it 'returns successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'assigns an instance variable accessable from the view' do
      expect(assigns(:post)).to eq(post)
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
    it 'has the correct response body text' do
      expect(response.body).to include('Post text')
    end
  end
end
