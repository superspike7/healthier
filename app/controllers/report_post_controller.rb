class ReportPostController < ApplicationController
  before_action :authorize_user

  def new
    @report = current_user.reports.build
  end

  def create
    @report = current_user.reports.build(reportpost_params)
    if @report.save
      redirect_to posts_path, notice: 'Report User Successfully.'
    else
      render :new
    end
  end

  private

  def reportpost_params
    @post_owner = Post.find_by(id: params[:post_id])
    params.permit(:reason, :report_type).merge(post_id: params[:post_id], reported_id: @post_owner.user_id)
  end
end
