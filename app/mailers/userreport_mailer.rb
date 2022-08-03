class UserreportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.userreport_mailer.violating_community_standard.subject
  #
  def violating_community_standard
    @greeting = "Hi"
    @reported_user = params[:reported_user]


    mail to: @reported_user.email,
    subject: "VIOLATING COMMUNITY STANDARD"
  end
end
