FactoryBot.define do
  factory :user do
    association :role

    name { "Test User" }
    sequence(:login) { |n| "user#{n}" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end