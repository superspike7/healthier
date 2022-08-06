FactoryBot.define do
  factory :timed_exercise do
    user { nil }
    name { "MyString" }
    description { "MyText" }
    hour { 1 }
    minutes { 1 }
  end
end
