require 'rails_helper'

RSpec.describe "Create or upload a post", type: :system do
    let!(:user) { create(:user) }

    it "creates a post to display on feed" do
        post_body = "This is a post"

        sign_in user
        visit posts_path

        fill_in "post_body", with: post_body
        click_on "commit"

        expect(page).to have_text(post_body)
        expect("flash").to be_present
    end
end