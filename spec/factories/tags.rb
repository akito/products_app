# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  label      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :tag do
    sequence(:label) { |n| "label#{n}" }
  end
end
