require 'faker'

FactoryBot.define do
  factory :like, class: Like do
    association :user
    association :product
  end
end
