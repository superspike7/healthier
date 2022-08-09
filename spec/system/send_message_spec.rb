require 'rails_helper'

RSpec.describe "Sending of message", type: :system do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }

  it 'creates a message to send to other users' do
    sign_in user
    visit direct_conversations_path

    click_on another_user.username
  end
end
