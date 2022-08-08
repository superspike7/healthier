class Member < ApplicationRecord
  belongs_to :conversation, counter_cache: true
  belongs_to :user

  scope :other_username, ->(user) { where.not(user:).first_member&.username }
  scope :current_user_username, ->(user) { where(user:).first_member&.username }
  scope :other_user, ->(user) { not_the_passed_user(user)&.first_member }
  scope :current_user, ->(user) { where(user:)&.first_member }
  scope :not_the_passed_user, ->(user) { where.not(user:) }
  scope :first_member, -> { first&.user }

  # broadcasts_to ->(_convo_members) { [conversation, :members] }, inserts_by: :append, partial: 'direct_conversations/conversation',
  #                                                                target: dom_id(converastion, :members),
  #                                                                locals: { member: self }

  def self.message_username_to_display(user)
    # query muna ng other = other_user
    # check if user == current_user
    # if user == current_user 
    # other.username
    # else
    # current_user_username
  end
end
