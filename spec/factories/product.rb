require 'faker'

FactoryBot.define do
  factory :product, class: Product do
    sequence(:name) { |n| "product#{n}" }
    sequence(:url) { |n| "https://product#{n}.com" }
    desc Faker::Lorem.sentence
    image Faker::App.name
    thumbnail Faker::App.name
    user
  end
end
