require 'faker'

FactoryBot.define do
  factory :user, class: User do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@test.com" }
    password 'password'
  end

  trait :admin do
    role 'admin'
  end

end
