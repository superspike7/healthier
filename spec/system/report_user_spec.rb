require 'rails_helper'

RSpec.describe "Report a user", type: :system do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }

  it "report another user for violating community standard" do
    sign_in user

    visit new_profile_report_user_path(another_user.id)

    choose ("reason_suspicious_or_spam")
    click_on "SUBMIT REPORT"

    expect(page).to have_text("Reported User Successfully.")
  end
end
