require 'rails_helper'

RSpec.describe "follow another user", type: :system do
    let!(:user) { create(:user) }
    let!(:other_user) {create(:other_user)}

    it 'change follow button to unfollow button' do

    sign_in user
    visit profile_path(other_user.username)
    expect(page).to have_button('Follow')

    click_button('Follow')
    expect(page).to have_button('Unfollow')
    end
end