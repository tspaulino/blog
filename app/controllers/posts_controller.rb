class PostsController < ApplicationController

  def index
    @posts = Post.published.order("updated_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end
end
