class Admin::ReportsController < AdminController
  def index
    dummy_reports = [
      { 
        reporter: 'Spike',
        type: 'user',
        target: 'Vinz',
        reasons: ['Sobrang Gwapo'],
        description: 'A truncated Description...',
        status: 'Pending',
      },
      { 
        reporter: 'Raynard',
        type: 'post',
        target: 'How To Get 6packs in one Day',
        reasons: ['Scam', 'Fake News'],
        description: 'A truncated Description...',
        status: 'Approved',
      },
      { 
        reporter: 'Danica',
        type: 'post',
        target: 'Check out my New Exercise Course',
        reasons: ['Advertisement', 'Promotion'],
        description: 'A truncated Description...',
        status: 'Rejected',
      },
    ]
    @reports = dummy_reports 
  end

  def show; end
  def new; end
  def destroy; end
end
