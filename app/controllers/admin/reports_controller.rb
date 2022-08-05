class Admin::ReportsController < AdminController
    before_action :set_report, only: [:show, :edit, :destroy]
  #   def index
  #   dummy_reports = [
  #     { 
  #       reporter: 'Spike',
  #       type: 'user',
  #       target: 'Vinz',
  #       reasons: ['Sobrang Gwapo'],
  #       description: 'A truncated Description...',
  #       status: 'Pending',
  #     },
  #     { 
  #       reporter: 'Raynard',
  #       type: 'post',
  #       target: 'How To Get 6packs in one Day',
  #       reasons: ['Scam', 'Fake News'],
  #       description: 'A truncated Description...',
  #       status: 'Approved',
  #     },
  #     { 
  #       reporter: 'Danica',
  #       type: 'post',
  #       target: 'Check out my New Exercise Course',
  #       reasons: ['Advertisement', 'Promotion'],
  #       description: 'A truncated Description...',
  #       status: 'Rejected',
  #     },
  #   ]
  #   @reports = dummy_reports 
  # end

  # def show; end
  # def edit; end
  # def destroy; end
  def index
      @reports = Report.includes([:reported, :post]).order("created_at DESC")
  end

  def show
      
  end

  def destroy
      @report.destroy
      redirect_to admin_reports_path, notice: "Report deleted!"
  end

  private
  def set_report
      @report = Report.find_by_id(params[:id])
  end

end
