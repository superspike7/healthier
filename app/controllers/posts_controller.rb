class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post successful'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post deleted'
    else
      render :edit
    end
  end

  private

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
