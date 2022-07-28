class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
    end


    def new 
    end

    def create
    end

    def edit
    end

    def update
        with_password = params[:user][:password].blank? ? "update_without_password" : "update"
        if @user.send(with_password, user_params)
            UserMailer.with(user: @user).update_username.deliver_later
            redirect_to admin_users_path, notice: "Update successful"
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to admin_users_path, notice: "Deleted #{@user.email}"
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username)
    end
end
