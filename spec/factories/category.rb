require 'faker'

FactoryBot.define do
  factory :category, class: Category do
    name 'Test_Category'
  end
end
