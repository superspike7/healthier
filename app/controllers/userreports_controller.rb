class UserreportsController < ApplicationController
    before_action :set_userreport, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
        @userreport = UserReport.new
    end

    def create
        @userreport = UserReport.new(userreport_params)

        if @userreport.save
            redirect_to root_path, notice: 'Report User Successfully.'
        else
          render :new
        end
    end

    def destroy
    end

    private
    def set_userreport
        @userreport = UserReport.find(params[:id])
    end

    def userreport_params
        params.require(:user_report).permit(:reported_id, :reporter_id, :reason)
    end
end
