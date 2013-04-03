class PostsController < ApplicationController
  def new
    @categories = Category.all
    @post = Post.new
  end

  def create
    post = Post.create(params[:post])
    redirect_to post, :notice => "YOUR EDIT URL (Save this!): #{root_url}posts/#{post.key}/edit"
  end

  def show
    @post = Post.find(params[:id])
    @category = Category.find(@post.category_id)
  end

  def edit
    @post = Post.find_by_key(params[:id])
    @categories = Category.all
    redirect_to root_path, :notice => "No post with that link" if @post.blank?
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to @post
  end
end
