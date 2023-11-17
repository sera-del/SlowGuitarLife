class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def account
    @user = current_user
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
end
