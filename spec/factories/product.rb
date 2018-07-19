require 'faker'

FactoryBot.define do
  factory :product, class: Product do
    name
    url
    desc Faker::Lorem.sentence
    image Faker::App.name
    thumbnail Faker::App.name
    trait :with_user do
      user
    end
  end

  sequence :name do |n|
    "test_app#{n}"
  end

  sequence :url do |n|
    "https://productsquare#{n}.com"
  end

end
