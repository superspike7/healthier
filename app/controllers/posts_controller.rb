class PostsController < ApplicationController
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

  def update
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
