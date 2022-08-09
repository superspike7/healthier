FactoryBot.define do
  factory :routine do
    association :user, factory: :user
    name { 'routine Test' }
    description { 'Test Description' }
  end
end
