class PostsController < ApplicationController
  require 'google/apis/youtube_v3'

  def find_videos(keyword, after: 2.years.ago, before: Time.now)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:api_key]

    keyword = params[:youtube_search]

    next_page_token = nil

    opt = {
      q: keyword,
      type: "video",
      max_results: 9,
      order: :viewCount,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601,
    }

    youtube.list_searches(:snippet, **opt)
  end

  def index
    @posts = Post.all.includes(:user)
  end

  def new
    @post = Post.new
    @user_id = current_user.id
    @youtube_data = find_videos(@keyword)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(current_user), notice: "新規投稿をしました"
    else
      redirect_to new_post_path, alert: "未入力の項目があります。"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @youtube_data = find_videos(@keyword)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(current_user), notice: "投稿を更新しました"
    else
      redirect_to edit_post_path, alert: "更新に失敗しました"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user), notice: "投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :youtube_url, :tag).merge(user_id: current_user.id)
  end
end
