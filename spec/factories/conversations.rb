FactoryBot.define do
  factory :conversation do
    factory :conversation_with_name do
      name { 'Test Conversation' }
    end
  end
end
