require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'assigns a variable to be accessed in views' do
      expect(assigns(:users)).to eq(User.all)
    end
    it 'has the correct response body text' do
      expect(response.body).to include('Number' || 'There are no users to display')
    end
  end

  describe 'GET #show' do
    before(:example) { get('/users/1') }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'assigns a variable to be accessed in views' do
      expect(assigns(:user)).to eq(User.find_by(id: 1) || 'There is no user')
    end
    it 'has the correct response body text' do
      expect(response.body).to include('I am super user')
    end
  end
end
