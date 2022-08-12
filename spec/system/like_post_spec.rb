require 'rails_helper'

RSpec.describe "Liking a post", type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  it 'increase like count of a post' do
    new_like_count = 1

    sign_in user

    visit posts_path

    within all('form > button')[0] do
      find('svg').click
    end

    expect(page).to have_text(new_like_count)
  end
end
