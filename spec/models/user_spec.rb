require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }

  describe '#existing_conversation_with' do
    context 'when current user is passed as an argument' do
      context 'and when there is an existing conversation to self' do
        let(:creation_of_own_conversation) { create(:conversation).members.create(user:) }
        it 'returns conversation to self' do
          own_conversation = creation_of_own_conversation.conversation
          conversation = user.existing_conversation_with(user)
          expect(conversation).to eq(own_conversation)
        end
      end

      context 'and when there is no existing conversation to self' do
        it 'returns nil' do
          conversation = user.existing_conversation_with(user)
          expect(conversation).to eq(nil)
        end
      end
    end

    context 'when other user is passed as an argument' do
      let(:creation_of_conversation_members) { create(:conversation).members.create([{ user: }, { user: other_user }]) }
      it 'returns conversation of the current user with other user' do
        conversation_with_other_user = creation_of_conversation_members.first.conversation
        conversation = user.existing_conversation_with(other_user)
        expect(conversation).to eq(conversation_with_other_user)
      end
    end
  end
end
