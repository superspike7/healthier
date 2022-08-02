class Member < ApplicationRecord
  belongs_to :conversation, counter_cache: true
  belongs_to :user

  scope :other_username, ->(user) { where.not(user:).first_member&.username }
  scope :current_user_username, ->(user) { where(user:).first_member&.username }
  scope :other_user, ->(user) { where.not(user:)&.first_member }
  scope :current_user, ->(user) { where(user:)&.first_member }
  scope :first_member, -> { first&.user }

  # broadcasts_to ->(_convo_members) { [conversation, :members] }, inserts_by: :append, partial: 'direct_conversations/conversation',
  #                                                                target: dom_id(converastion, :members),
  #                                                                locals: { member: self }

end
