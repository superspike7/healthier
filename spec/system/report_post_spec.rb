require 'rails_helper'

RSpec.describe "Report a post", type: :system do
    let!(:user) { create(:user)}
    let!(:post) {create(:post)}

    it "user submit a report for posting malicious content" do
        sign_in user
        visit posts_path

        click_link(href: "/posts/#{post.id}/report_post/new")

        choose ("reason_false_information")
        click_on "SUBMIT REPORT"

        expect(page).to have_text("Reported Post Successfully.")
    end
end