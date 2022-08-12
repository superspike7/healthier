require 'rails_helper'

RSpec.describe "Notification count", type: :system do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:post) { create(:post) }

  context "when another user likes a user's post" do
    it 'increases the notification count by 1' do
    end
  end

  context "when another user comments a user's post" do
    it 'increases notification count by 1' do
    end
  end

  context "when another user initialized a conversation" do
    it 'increases notification count by 1' do
    end
  end
end
