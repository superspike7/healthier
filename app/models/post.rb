class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_noticed_notifications model_name: 'Notification'
  has_many :reports, class_name: 'Report', foreign_key: 'post_id', dependent: :destroy

  scope :show_latest, -> { order('created_at DESC') }
  scope :with_attachments_and_user, -> { includes(:user, images_attachments: :blob) }

  def mark_post_activities_as_read(user)
    notifications_as_post.where(recipient: user).mark_as_read!
  end
end
