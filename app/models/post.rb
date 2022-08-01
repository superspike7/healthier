class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy 

  scope :show_latest, -> { order('created_at DESC') }
  scope :with_attachments_and_user, -> { includes(:user, images_attachments: :blob) }



end
