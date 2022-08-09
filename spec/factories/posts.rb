FactoryBot.define do
  factory :post do
    association :user, factory: :user
    body { 'Test body' }
  end
end
