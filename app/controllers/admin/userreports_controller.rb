class Admin::UserreportsController < ApplicationController
    before_action :set_userreport, only: [:show, :edit, :update, :destroy]
    def index
        @userreports = Userreport.all
    end

    def show
        
    end

    def destroy
        @userreport.destroy
        redirect_to admin_userreports_path, notice: "Report deleted!"
    end

    private
    def set_userreport
        @userreport = Userreport.find_by_id(params[:id])
    end
end
