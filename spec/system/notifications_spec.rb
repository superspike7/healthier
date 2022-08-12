require 'rails_helper'

RSpec.describe "Notification", type: :system do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:post) { create(:post, user:) }

  context "when another user likes a user's post" do
    it 'creates a new notification' do
      another_user.like_post(post.id)
      like_notification_body = 'liked your post'

      sign_in user

      visit notifications_path

      expect(page).to have_text(like_notification_body)
    end
  end

  context "when another user comments a user's post" do
    it 'creates a new notification' do
      another_user.comments.build(body: 's', post_id: post.id).add(sender: another_user, receiver: user)
      comment_notification_body = 'commented on your post'

      sign_in user

      visit notifications_path

      expect(page).to have_text(comment_notification_body)
    end
  end

  context "when another user initialized a conversation" do
    it 'increases notification count by 1' do
      Conversation.create_direct!(another_user, user)
      conversation_notification_body = 'created a conversation with you'

      sign_in user
      
      visit notifications_path

      expect(page).to have_text(conversation_notification_body)
    end
  end
end
