class ReportUserController < ApplicationController
    before_action :set_report, only: [:show, :edit, :update, :destroy]

    def new
        @report = current_user.reports.build
    end

    def create
        @report = current_user.reports.build(report_params)
        if @report.save
            redirect_to posts_path, notice: 'Report User Successfully.'
        else
          render :new
        end
    end

    def destroy
    end

    private
    
    def set_report
        @report = current_user.reports.find(params[:id])
    end

    def report_params
        params.permit(:reason, :report_type).merge(reported_id: params[:profile_id])
    end
end
