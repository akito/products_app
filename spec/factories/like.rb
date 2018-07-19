require 'faker'

FactoryBot.define do
  factory :like, class: Like do
    user
    product
  end
end
