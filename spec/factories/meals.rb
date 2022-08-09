FactoryBot.define do
  factory :meal do
    association :user, factory: :user
    name { 'Test meal' }
    description { 'Test description' }
  end
end
