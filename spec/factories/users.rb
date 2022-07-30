FactoryBot.define do
  factory :user do
    username { 'user1' }
    email { 'user1@test.com' }
    password { 'password' }
    confirmed_at { Time.now }

    factory :other_user do
      username { 'user2' }
      email { 'user2@test.com' }
    end

    factory :admin do
      username { 'admin1' }
      # whatever the admin implementation that makes user admin
    end
  end
end
