class ReportUserController < ApplicationController

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

    private

    def report_params
        params.permit(:reason, :report_type).merge(reported_id: params[:profile_username])
    end
end
