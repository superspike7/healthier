class User < ApplicationRecord
  has_many :reporter_user_reports, class_name: 'User', foreign_key: 'reporter_id'
  has_many :reporter_user_reports, class_name: 'User', foreign_key: 'reported_id'

  has_many :posts
  has_many :comments
  has_many :likes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :members, dependent: :destroy
  has_many :conversations, through: :members, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy

  validates :username, format: { without: /\s/, message: 'Spaces are not allowed.' }, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, email: auth.info.email).first_or_create do |user|
      user.username = auth.info.email.split('@')[0]
      user.password = Devise.friendly_token[0, 20]

      user.skip_confirmation!
    end
  end

  def existing_conversation_with(other_user)
    if self == other_user
      self_conversation = conversations.where(members_count: 1)
      self_conversation.blank? ? nil : self_conversation.first
    else
      conversations.map { |conversation| conversation.members.find_by(user: other_user)&.conversation }.compact.first
    end
  end

  def total_unread_messages
    unread_messages_count = notifications.unread_messages.count
    unread_messages_count.zero? ? nil : unread_messages_count
  end

  def total_unread_notifications
    unread_notifications_count = notifications.unread_notifications_except_message.count
    unread_notifications_count.zero? ? nil : unread_notifications_count
  end
end
