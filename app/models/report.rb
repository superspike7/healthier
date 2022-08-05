class Report < ApplicationRecord
    belongs_to :user
    belongs_to :reported, class_name: 'User'
end
