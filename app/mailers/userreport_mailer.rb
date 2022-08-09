class UserreportMailer < ApplicationMailer
  def violating_community_standard
    @greeting = "Hi"
    @reported_user = params[:reported_user]

    mail to: @reported_user.email,
    subject: "VIOLATING COMMUNITY STANDARD"
  end
end
