require 'faker'

FactoryBot.define do
  factory :product, class: Product do
    sequence(:name) { |n| "Product#{n}" }
    sequence(:url) { |n| "https://productsquare#{n}.com" }
    desc Faker::Lorem.sentence
    image Faker::App.name
    thumbnail Faker::App.name
    user
  end
end
