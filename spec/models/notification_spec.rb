require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:user) { create(:user) }
  let(:conversation) { create(:conversation) }
  let!(:message_notification) { MessageNotification.with(conversation:).deliver(user) }

  describe '.all_except_message_notifications' do
    it 'returns all notifications without message notifications' do
      expect(Notification.all_except_message_notifications).to_not include(message_notification)
    end
  end

  describe '.unread_messages' do
    it 'returns unread message notifications' do
      expect(Notification.unread_messages).to include(Notification.first)
    end
  end
end
