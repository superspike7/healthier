class Member < ApplicationRecord
  belongs_to :conversation, counter_cache: true
  belongs_to :user
end
