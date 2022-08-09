FactoryBot.define do
  factory :repetition_exercise do
    association :user, factory: :user
    name { 'Repetition Test Exercise' }
    description { 'Test Description' }
    repetition { 1 }
    set { 1 }
  end
end
