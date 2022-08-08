class UserMailer < ApplicationMailer
  def update_username
    @greeting = "Hi"
    @user = params[:user]

    mail to: @user.email, 
    subject: "User Update"
  end
end
