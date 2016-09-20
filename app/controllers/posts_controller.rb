class PostsController < ApplicationController

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
  end
end
