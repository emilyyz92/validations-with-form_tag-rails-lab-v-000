class PostsController < ApplicationController
  def show
    set_post
  end

  def edit
    set_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    set_post

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
