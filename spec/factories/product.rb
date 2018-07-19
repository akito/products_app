require 'faker'

FactoryBot.define do
  factory :product, class: Product do
    name 'test_app'
    url Faker::Internet.url
    desc Faker::Lorem.sentence
    image Faker::App.name
    thumbnail Faker::App.name
    trait :with_user do
      user
    end
  end
end

# TODO: User_id関連付け
