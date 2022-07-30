FactoryBot.define do
  factory :member do
    association :user, factory: :user
    association :conversation, factory: :conversation

    factory :other_member do
      association :user, factory: :other_user
    end
  end
end
