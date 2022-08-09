FactoryBot.define do
  factory :food do
    association :user, factory: :user
    name { "Food" }
    description { "Testfood" }
    calories { 2 }
    carbohydrates { 1.5 }
    fats { 4 }
    protein { 6 }
  end
end
