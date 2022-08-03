FactoryBot.define do
  factory :comment_notification do
    recipient { nil }
    type { "" }
    params { "" }
    read_at { "2022-08-03 09:08:08" }
  end
end
