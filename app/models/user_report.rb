class UserReport < ApplicationRecord
    belongs_to :reporter_id, class_name: 'User'
    belongs_to :reported_id, class_name: 'User'
end
