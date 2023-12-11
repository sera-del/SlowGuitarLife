require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe "バリデーションのテスト" do
    context "値が全て入っている場合" do
      it "有効であること" do
        expect(post).to be_valid
      end
    end

    describe "title属性" do
      context "空欄の場合" do
        it "無効となること" do
          post.title = ""
          expect(post).to be_invalid
        end
      end

      context "20文字以下の場合" do
        it "有効であること" do
          str = "a" * 15
          post.title = "#{str}テストです"
          expect(post).to be_valid
        end
      end

      context "20文字を超える場合" do
        it "無効であること" do
          str = "a" * 16
          post.title = "#{str}テストです"
          expect(post).to be_invalid
        end
      end
    end

    describe "content属性" do
      context "空欄の場合" do
        it "無効となること" do
          post.content = ""
          expect(post).to be_invalid
        end
      end

      context "250文字以下の場合" do
        it "有効であること" do
          str = "a" * 245
          post.content = "#{str}テストです"
          expect(post).to be_valid
        end
      end

      context "250文字を超える場合" do
        it "無効であること" do
          str = "a" * 246
          post.content = "#{str}テストです"
          expect(post).to be_invalid
        end
      end
    end

    describe "category属性" do
      context "空欄の場合" do
        it "無効となること" do
          post.category = ""
          expect(post).to be_invalid
        end
      end
    end
  end
end
