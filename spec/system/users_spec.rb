require 'rails_helper'

RSpec.describe "User", type: :system do
  let(:user) { create(:user) }

  describe "ユーザー機能テスト" do
    describe "ログイン前" do
      before do
        visit root_path
      end

      describe "ユーザー新規登録" do
        context "フォームの入力値が正常の場合" do
          it "ユーザーの新規作成が成功すること" do
            click_link ">新規登録はこちら"
            fill_in "ユーザー名", with: "user"
            fill_in "メールアドレス", with: "sample@example.com"
            fill_in "パスワード", with: "password"
            fill_in "確認用パスワード", with: "password"
            click_button "新規登録する"
            expect(current_path).to eq root_path
            expect(page).to have_content "アカウント登録が完了しました。"
          end
        end

        context "メールアドレスが未入力の場合" do
          it "ユーザーの新規作成が失敗すること" do
            click_link ">新規登録はこちら"
            fill_in "ユーザー名", with: "user"
            fill_in "メールアドレス", with: nil
            fill_in "パスワード", with: "password"
            fill_in "確認用パスワード", with: "password"
            click_button "新規登録する"
            expect(current_path).to eq "/users"
            expect(page).to have_content "メールアドレスを入力してください"
          end
        end

        context "すでに同じメールアドレスが登録されている場合" do
          it "ユーザーの新規作成が失敗すること" do
            click_link ">新規登録はこちら"
            fill_in "ユーザー名", with: "user"
            fill_in "メールアドレス", with: user.email
            fill_in "パスワード", with: "password"
            fill_in "確認用パスワード", with: "password"
            click_button "新規登録する"
            expect(current_path).to eq "/users"
            expect(page).to have_content "メールアドレスはすでに存在します"
          end
        end
      end

      describe "ユーザーログイン" do
        before do
          visit root_path
        end

        context "ユーザー登録をしている場合" do
          it "ログインができること" do
            click_link ">ログインはこちら"
            fill_in "メールアドレス", with: user.email
            fill_in "パスワード", with: user.password
            click_button "ログインする"
            expect(current_path).to eq root_path
            expect(page).to have_content "ログインしました。"
          end
        end

        context "ユーザー登録をしていない場合" do
          it "ログインできないこと" do
            click_link ">ログインはこちら"
            fill_in "メールアドレス", with: "a@gmail.com"
            fill_in "パスワード", with: "123456"
            click_button "ログインする"
            expect(current_path).to eq new_user_session_path
            expect(page).to have_content "メールアドレスまたはパスワードが違います。"
          end
        end

        context "ゲストログインを使用したい場合" do
          it "ゲストログインができること" do
            click_link "ゲストログイン"
            expect(page).to have_content "ゲストユーザーとしてログインしました。"
          end
        end
      end
    end

    describe "ログイン後" do
      before do
        sign_in user
        visit users_account_path
      end

      describe "ユーザー編集" do
        context "フォームの入力値が正常の場合" do
          it "ユーザーの編集に成功すること" do
            click_link "編集する"
            fill_in "ユーザー名", with: "person"
            fill_in "メールアドレス", with: "sample@example"
            fill_in "現在のパスワード", with: "password"
            click_button "変更する"
            expect(current_path).to eq users_account_path(user)
            expect(page).to have_content "アカウント情報を変更しました。"
          end
        end

        context "メールアドレスが空欄の場合" do
          it "ユーザーの編集に失敗すること" do
            click_link "編集する"
            fill_in "メールアドレス", with: nil
            fill_in "現在のパスワード", with: "password"
            click_button "変更する"
            expect(current_path).to eq "/users"
            expect(page).to have_content "メールアドレスを入力してください"
          end
        end
      end

      describe "ユーザーログアウト" do
        before do
          sign_in user
          visit root_path
        end

        context "ログインしている場合" do
          it "ログアウトできること" do
            find("#navbarDropdownMenuAvatar").click
            click_link "ログアウト"
            accept_alert
            expect(current_path).to eq root_path
            expect(page).to have_content "ログアウトしました。"
          end
        end
      end
    end
  end
end
