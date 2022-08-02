require 'rails_helper'

RSpec.describe Member, type: :model do
  let!(:first_member) { create(:member) }
  let!(:second_member) { create(:other_member, conversation: first_member.conversation) }

  describe '.first_username' do
    it 'returns the username of the first member in a member collection' do
      expect(Member.first_member.username).to eq(first_member.user.username)
    end
  end

  describe '.other_username' do
    it 'returns the username of the first user that is not the current user in a member collection' do
      expect(Member.other_username(first_member.user)).to eq(second_member.user.username)
    end
  end
end
