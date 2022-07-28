class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.update_username.subject
  #
  def update_username
    @greeting = "Hi"
    @user = params[:user]

    mail to: @user.email, 
    subject: "User Update"
  end
end
