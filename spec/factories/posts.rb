FactoryBot.define do
  factory :post do
    association :user, factory: :user
    body { 'Test body' }

    factory :yesterday_post do
      created_at { 1.day.ago }
      updated_at { 1.day.ago }
    end
  end
end
