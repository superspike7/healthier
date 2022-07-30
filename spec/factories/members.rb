FactoryBot.define do
  factory :member do
    association :user, factory: :user
    association :conversation, factory: :conversation
  end
end
