require 'rails_helper'

RSpec.describe "like a post", type: :system do
    let!(:user) { create(:user) }
    let!(:post) {create(:post)}

    it 'change like button to unlike button once a post is liked' do

    sign_in user
    visit posts_path
    expect(page).to have_button('Like')

    click_button('Like')
    expect(page).to have_button('Unlike')
    end
end