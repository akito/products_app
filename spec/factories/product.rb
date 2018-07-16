require 'faker'

FactoryBot.define do
  factory :product do
    name Faker::App.name
    url Faker::Internet.url
    desc Faker::Lorem.sentence
    image Faker::App.name
    thumbnail Faker::App.name
  end
end

# TODO: User_id関連付け
