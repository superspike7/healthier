class Admin::ReportsController < AdminController
  before_action :set_report, only: [:show, :edit, :destroy]

  def index
    @reports = Report.includes([:reported]).order("created_at DESC")
  end

  def show; end

  def destroy
    @report.destroy
    redirect_to admin_reports_path, notice: "Report deleted!"
  end

  private

  def set_report
    @report = Report.find_by_id(params[:id])
  end
end
