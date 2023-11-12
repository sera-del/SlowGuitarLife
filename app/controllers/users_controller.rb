class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def account
    @user = current_user
  end
end
