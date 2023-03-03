require 'rails_helper'

RSpec.describe 'Posts', type: :request do
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
      expect(response.body).to include('There is no user with this id')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/1/posts/3' }
    it 'returns successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'assigns an instance variable accessable from the view' do
      expect(assigns(:post)).to eq(Post.find_by(author_id: 1, id: 3) || 'There is no post')
    end
    it 'renders the correct template' do
      expect(response).to render_template('show')
    end
    it 'has the correct response body text' do
      expect(response.body).to include('There is no post')
    end
  end
end
