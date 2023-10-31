class UsersController < ApplicationController
  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :user_img)
  end
end
