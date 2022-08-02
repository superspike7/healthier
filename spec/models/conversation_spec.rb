require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:user) { create(:user) }
  let(:another_user) { create(:other_user) }
  let(:conversation) { create(:conversation) }
  let(:member_of_conversation) { create(:member, conversation:) }
  let(:member_of_conversation_with_name) { create(:member, conversation: create(:conversation_with_name)) }

  describe '::create_direct!' do
    context 'when one user is involved in the creation' do
      let(:conversation_with_self) { user.conversations.where(members_count: 1).first }
      it 'creates a conversation to oneself' do
        expect(Conversation.create_direct!(user, user)).to eq(conversation_with_self)
      end
    end

    context 'when two users are involved in the creation' do 
      let(:conversation_with_other_user) {user.conversations.where(members_count: 2).first}
      it 'creates a conversation with another user' do
        expect(Conversation.create_direct!(user, another_user)).to eq(conversation_with_other_user)
      end
    end
  end
  
  describe '#show_conversation_name' do
    context 'and when current user is passed as an argument' do
      it 'returns the username of the current user' do
        conversation = member_of_conversation.conversation
        current_user = member_of_conversation.user
        expect(conversation.show_conversation_name(current_user)).to eq(current_user.username)
      end
    end

    context 'and when other user is passed as an argument' do
      let!(:another_member_of_conversation) { create(:other_member, conversation:) }
      it 'returns the username of the other user' do
        conversation = member_of_conversation.conversation
        other_user = another_member_of_conversation.user
        expect(conversation.show_conversation_name(other_user)).to eq(other_user.username)
      end
    end
  end
end
