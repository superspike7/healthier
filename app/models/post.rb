class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy 

  scope :show_latest, -> { order('created_at DESC') }
  scope :comment_desc, -> { order('created_at DESC') }
  scope :display_comments, -> { where(post_id: params[:id]) }
  scope :with_attachments_and_user, -> { includes(:user, images_attachments: :blob) }
  scope :include_user_only, -> { includes(:user) }


end
