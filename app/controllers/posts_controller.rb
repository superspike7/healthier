class PostsController < ApplicationController
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
