class Admin::UsersController < AdminController
    before_action :set_user, only: [:edit, :update, :destroy]

    def index
      @users = User.all.includes([:avatar_attachment])
      @newest_user = @users.last
    end

    def show
      @user = User.find_by!(username: params[:username])
      
      # temporary fetch, this should be @user.posts
      @posts = @user.posts.with_attachments_and_user.show_latest
      @comments = Comment.include_user_only.comment_asc
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
        UserreportMailer.with(reported_user: @user).violating_community_standard.deliver_now
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
