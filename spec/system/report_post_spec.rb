require 'rails_helper'

RSpec.describe "user reports another user", type: :system do
    let!(:user) { create(:user)}
    let!(:post) {create(:post)}

    it "report a post" do
        sign_in user
        visit posts_path

        click_link(href: "/posts/#{post.id}/report_post/new")

        choose ("reason_false_information")
        click_on "SUBMIT REPORT"

        expect("Report User Successfully.").to be_present
    end
end