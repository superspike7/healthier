FactoryBot.define do
  factory :food do
    association :user, factory: :user
    name { "Food" }
    description { "Testfood" }
    calories { 1.5 }
    carbohydrates { 1.5 }
    fats { 1.5 }
    protein { 1.5 }
  end
end
