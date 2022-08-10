require 'rails_helper'

RSpec.describe "comment to a post", type: :system do
    let!(:user) { create(:user) }
    let!(:post) {create(:post)}

    it 'submit comments to a post' do
    comment_body = "This is a test comment"

    sign_in user
    visit posts_path

    click_link(href: "/posts/#{post.id}")

    expect(page).to have_button('Comment')

    fill_in "comment_body", with: comment_body
    click_on "Comment"

    expect(page).to have_text(comment_body)

    end
end