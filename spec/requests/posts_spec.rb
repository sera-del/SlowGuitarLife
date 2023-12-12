require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /Posts" do
    let(:user) { create(:user) }
    let(:post) { create(:post, user: user) }

    before do
      sign_in user
      get "/posts"
    end

    it "HTTPレスポンスコードが200を返すこと" do
      expect(response).to have_http_status(200)
    end
  end
end
