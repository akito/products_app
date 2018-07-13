require 'faker'

FactoryBot.define do
  factory :user do
    name Faker::Internet.username
    email Faker::Internet.email
    password Faker::Internet.password
  end

  # trait :with_likes do
  #   transient do
  #     likes_count 5
  #   end
  #   after(:create) do |user, evaluator|
  #     create_list(:like, evaluator.likes_count, user: user)
  #   end
  # end
end
