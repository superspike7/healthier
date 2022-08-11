class PostsController < ApplicationController
  before_action :authorize_user

  def index
    @posts = Post.all.with_attachments_and_user.show_latest
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user, user: :avatar_attachment)
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post successfully created.'
    else
      render :new
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
    redirect_back_or_to posts_url, notice: 'Post successfully deleted'
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
