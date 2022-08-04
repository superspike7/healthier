class UserreportsController < ApplicationController
    before_action :set_userreport, only: [:show, :edit, :update, :destroy]

    def index
        @userreports = Userreport.all
    end

    def new
        @userreport = current_user.userreports.build
    end

    def create
        @userreport = current_user.userreports.build(userreport_params)
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
        @userreport = current_user.userreports.find(params[:id])
    end

    def userreport_params
        params.permit(:reason).merge(reported_id: params[:profile_id])
    end
end
