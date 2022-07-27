class PostsController < ApplicationController
  def index
  end

  def show
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
    params.require(:post).permit(:body)
  end
end
