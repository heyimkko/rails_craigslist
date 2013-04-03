class PostsController < ApplicationController
  def new
    @categories = Category.all
    @post = Post.new
  end

  def create
    post = Post.create(params[:post])
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.find(@post.category_id)
  end
end
