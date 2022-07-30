FactoryBot.define do
  factory :message do
    association :user, factory: :user
    association :conversation, factory: :conversation
    content { 'Test message' }
  end
end
