require 'rails_helper'

RSpec.describe "Report a user", type: :system do
  let!(:user) { create(:user)}
  let!(:another_user) { create(:user) }

  it "report another user for violating community standard" do
    sign_in user
    visit profile_path(another_user.username)

    click_link(href: "/profile/#{user.id}/report_user/new")

    choose ("reason_suspicious_or_spam")
    click_on "SUBMIT REPORT"

    expect(page).to have_text("Reported User Successfully.")
  end
end
