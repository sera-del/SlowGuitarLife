require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe "投稿機能テスト" do
    before do
      sign_in user
      visit root_path
    end

    describe "新規投稿テスト" do
      context "フォームの入力値が正常な場合" do
        it "新規投稿の作成が成功すること" do
          click_link ">ギターフレーズを投稿する"
          fill_in "タイトル", with: post.title
          find("#post_category").find("option[value='クラシック']").select_option
          fill_in "コメント", with: post.content
          fill_in "Youtube共有リンク", with: post.youtube_url
          fill_in "タグ", with: post.tag
          click_button "投稿する"
          expect(current_path).to eq user_path(user)
          expect(page).to have_content post.title
          expect(page).to have_content "新規投稿をしました"
        end
      end

      context "タイトルが未入力の場合" do
        it "新規投稿の作成が失敗すること" do
          click_link ">ギターフレーズを投稿する"
          fill_in "タイトル", with: nil
          find("#post_category").find("option[value='クラシック']").select_option
          fill_in "コメント", with: post.content
          fill_in "Youtube共有リンク", with: post.youtube_url
          fill_in "タグ", with: post.tag
          click_button "投稿する"
          expect(current_path).to eq new_post_path
          expect(page).to have_content "未入力の項目があります。"
        end
      end
    end

    describe "投稿編集テスト" do
      before do
        sign_in(post.user)
      end

      context "フォームの入力値が正常な場合" do
        it "投稿の編集が成功すること" do
          visit user_path(user.id)
          click_link "詳細"
          click_link "編集する"
          fill_in "タイトル", with: "跳躍練習"
          find("#post_category").find("option[value='ロック']").select_option
          fill_in "コメント", with: "跳躍はミスしやすいので丁寧に弾きましょう。"
          fill_in "Youtube共有リンク", with: post.youtube_url
          fill_in "タグ", with: post.tag
          click_button "更新する"
          expect(current_path).to eq user_path(user.id)
          expect(page).to have_content "跳躍練習"
          expect(page).to have_content "投稿を更新しました"
        end
      end

      context "タイトルが未入力の場合" do
        it "投稿の編集が失敗すること" do
          visit user_path(user.id)
          click_link "詳細"
          click_link "編集する"
          fill_in "タイトル", with: nil
          find("#post_category").find("option[value='ロック']").select_option
          fill_in "コメント", with: "跳躍はミスしやすいので丁寧に弾きましょう。"
          fill_in "Youtube共有リンク", with: post.youtube_url
          fill_in "タグ", with: post.tag
          click_button "更新する"
          expect(current_path).to eq edit_post_path(user.id)
          expect(page).to have_content "更新に失敗しました"
        end
      end
    end
  end

  describe "検索機能テスト" do
    before do
      sign_in(post.user)
      visit root_path
    end

    context "投稿名の検索ができる場合" do
      it "投稿名が音階練習という投稿が表示されていること" do
        click_link ">ギターフレーズを投稿する"
        fill_in "タイトル", with: post.title
        find("#post_category").find("option[value='クラシック']").select_option
        fill_in "コメント", with: post.content
        fill_in "Youtube共有リンク", with: post.youtube_url
        fill_in "タグ", with: post.tag
        click_button "投稿する"
        expect(page).to have_content "音階練習"

        visit posts_path

        find(".main-container").fill_in "keyword", with: "音階練習"
        find(".main-container").click_button "検索"
        expect(page).to have_content "音階練習"
      end
    end

    context "タグ名の検索ができる場合" do
      it "タグ名が音階であり、投稿名が音階練習という投稿が表示されていること" do
        visit posts_path
        find("#word").find("option[value='音階']").select_option
        expect(page).to have_content "音階"
        expect(page).to have_content "音階練習"
      end
    end
  end
end
