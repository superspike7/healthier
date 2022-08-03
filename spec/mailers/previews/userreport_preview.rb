# Preview all emails at http://localhost:3000/rails/mailers/userreport
class UserreportPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/userreport/violating_community_standard
  def violating_community_standard
    UserreportMailer.violating_community_standard
  end

end
