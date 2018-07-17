require 'faker'

FactoryBot.define do
  factory :user, class: User do
    name 'test'
    email Faker::Internet.email
    password Faker::Internet.password
  end

  trait :admin do
    role 'admin'
  end
end
