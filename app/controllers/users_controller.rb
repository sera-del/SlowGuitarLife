class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def account
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :user_img)
  end
end
