require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Test User', photo: 'URL', bio: 'Bio') }
  let!(:post) { Post.create(author: user, title: 'Test Post', text: 'This is a test post.') }

  describe 'GET /index' do
    it 'returns http success' do
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Display single post details here')
    end
  end
end
