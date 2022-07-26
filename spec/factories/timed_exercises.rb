FactoryBot.define do
  factory :timed_exercise do
    association :user, factory: :user
    name { 'Timed Test Exercise' }
    description { 'Test Description' }
    hour { 1 }
    minutes { 1 }
  end
end
