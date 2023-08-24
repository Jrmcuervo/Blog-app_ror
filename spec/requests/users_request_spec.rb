require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include("Here is a list of all users")
    end
  end

  describe "GET /show" do
    let!(:user) { User.create(name: "Test User", photo: "URL", bio: "Bio") }

    it "returns http success" do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include("Display single user details here")
    end
  end
end
