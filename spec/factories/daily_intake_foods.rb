FactoryBot.define do
  factory :daily_intake_food do
    association :daily_intake, factory: :daily_intake
    association :food, factory: :food
  end
end
