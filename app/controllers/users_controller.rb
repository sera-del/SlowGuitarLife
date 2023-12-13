class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def account
    @user = current_user
  end

  def withdraw
    @user = current_user
    if @user.email == "sample@example.com"
      redirect_to :root, alert: "ゲストユーザーは削除できません"
    else
      @user = User.find(current_user.id)
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path, notice: "退会処理を実行いたしました"
    end
  end
end
