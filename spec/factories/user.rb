require 'faker'

FactoryBot.define do
  factory :user, class: User do
    name Faker::Internet.username
    email Faker::Internet.email
    password Faker::Internet.password
  end
end
