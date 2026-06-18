FactoryBot.define do
  factory :role do
    sequence(:code) { |n| "ROLE_#{n}" }
    description { "Test role" }
  end
end