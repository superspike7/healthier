class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :members
  has_many :conversations, through: :members
  has_many :messages

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
end
