class PostsController < ApplicationController
  before_filter :authorize
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
    flash[:success] = "Thank you for the new post submission!!!"
    redirect_to posts_path
  else
    flash.now[:alert] = "Sorry there's been an issue with the submission! Please check and resubmit again."
  end
end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to post_path(@post)
    end
    if @post.update(post_params)
      flash[:success] = "post updated!"
    redirect_to(post_path(@post))
  else
    flash.now[:alert] = "Update failed. Please check and try again."
    render :edit
  end
end

  def destroy
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to post_path(@post)
    end
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
