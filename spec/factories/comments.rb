FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :post, factory: :post
    name { 'Category Test' }
    description { 'Test Description' }

    factory :yesterday_comment do
      created_at { 1.day.ago }
      updated_at { 1.day.ago }
    end
  end
end
