FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :post, factory: :post
    name { 'Category Test' }
    description { 'Test Description' }
  end
end
