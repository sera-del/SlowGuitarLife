require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#guest" do
    context "ゲストユーザーが作成された場合" do
      it "ユーザー名がゲストになっていること" do
        user = User.guest
        expect(user.username).to eq "ゲスト"
      end
    end
  end

  describe "#active_for_authentication?" do
    context "退会している場合" do
      it "trueを返すこと" do
        user = User.new(
          username: "user",
          email: "user@example.com",
          is_deleted: false
        )
        expect(user.active_for_authentication?).to eq true
      end
    end
  end
end
