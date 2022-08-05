FactoryBot.define do
  factory :rep_exercise do
    user { nil }
    name { "MyString" }
    description { "MyText" }
    repetition { 1 }
    set { 1 }
  end
end
