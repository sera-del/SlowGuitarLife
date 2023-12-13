class SearchesController < ApplicationController
  def tag_search
    @word = params[:word]
    @posts = Post.where(tag: @word)
  end

  def keyword_search
  end
end
