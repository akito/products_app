require 'faker'

FactoryBot.define do
  factory :user, class: User do
    name 'Test'
    email Faker::Internet.email
    password Faker::Internet.password
  end
end
