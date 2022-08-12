require 'rails_helper'

RSpec.describe "Sending of message", type: :system do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }

  it 'creates a message to send to other users' do
    message_body = 'Hello'

    sign_in user
    visit direct_conversations_path

    within all('form')[1] do
      click_on another_user.username
    end

    fill_in 'message_content', with: message_body

    within all('form')[3] do
      find('button').click
    end

    expect(page).to have_text(message_body)
  end
end
