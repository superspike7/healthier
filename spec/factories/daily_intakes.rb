FactoryBot.define do
  factory :daily_intake do
    association :user, factory: :user
  end
end
