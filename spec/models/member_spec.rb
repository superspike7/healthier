require 'rails_helper'

RSpec.describe Member, type: :model do
  let!(:first_member) { create(:member) }
  let!(:second_member) { create(:other_member, conversation: first_member.conversation) }

  describe '.first_member' do
    it 'returns a user record of the first member in a member collection' do
      expect(Member.first_member).to eq(first_member.user)
    end
  end

  describe '.not_the_passed_user' do
    it 'returns a member collection that excludes the passed user' do
      expect(Member.not_the_passed_user(first_member.user)).to_not include(first_member)
    end
  end

  describe '.current_user' do
    it 'returns the user record of the passed user' do
      expect(Member.current_user(first_member.user)).to eq(first_member.user)
    end
  end

  describe '.other_user' do
    it 'returns the user record of the user other than the passed user' do
      expect(Member.other_user(first_member.user)).to eq(second_member.user)
    end
  end

  describe '.other_username' do
    it 'returns the username of the user other than the passed user' do
      expect(Member.other_username(first_member.user)).to eq(second_member.user.username)
    end
  end

  describe 'current_user_username' do
    it 'returns the username of the passed user' do
      expect(Member.current_user_username(first_member.user)).to eq(first_member.user.username)
    end
  end
end
