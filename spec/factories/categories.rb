FactoryBot.define do
  factory :category do
    association :user, factory: :user
    name { 'Category Test' }
    description { 'Test Description' }
  end
end
