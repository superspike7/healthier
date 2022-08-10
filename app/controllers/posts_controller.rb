class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all.with_attachments_and_user.show_latest
    @comments = Comment.include_user_only.comment_asc
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user, user: :avatar_attachment)
  end

  def new
    @new_post = current_user.posts.build
    @comment = current_user.comments.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post successful'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was deleted'
  end

  private

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
