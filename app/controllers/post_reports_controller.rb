class PostReportsController < ApplicationController
  def new
    @report = Post.find(params[:post_id])
  end
end
