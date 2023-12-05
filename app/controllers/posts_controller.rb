class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to users_account_path(current_user), notice: "新規投稿をしました"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :tag).merge(user_id: current_user.id)
  end
end
