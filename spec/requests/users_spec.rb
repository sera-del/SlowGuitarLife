require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "ユーザーページのテスト" do
    let!(:user) { create(:user) }

    before do
      sign_in user
      get user_path(user.id)
    end

    it "HTTPレスポンスコードが200を返すこと" do
      expect(response).to have_http_status(200)
    end

    it "ユーザー名が表示されていること" do
      expect(response.body).to include(user.username)
    end

    it "ギターの種類が表示されていること" do
      expect(response.body).to include(user.guitar_type)
    end

    it "経験年数が表示されていること" do
      expect(response.body).to include(user.years_experience.to_s)
    end

    it "音楽の種類が表示されていること" do
      expect(response.body).to include(user.category)
    end
  end
end
