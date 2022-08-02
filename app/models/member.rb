class Member < ApplicationRecord
  belongs_to :conversation, counter_cache: true
  belongs_to :user

  scope :other_username, ->(user) { where.not(user:).first_username }
  scope :current_user_username, ->(user) { where(user:).first_username }
  scope :first_username, -> { first&.user&.username }

  # broadcasts_to ->(_convo_members) { [conversation, :members] }, inserts_by: :append, partial: 'direct_conversations/conversation',
  #                                                                target: dom_id(converastion, :members),
  #                                                                locals: { member: self }
end
