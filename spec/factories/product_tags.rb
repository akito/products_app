# == Schema Information
#
# Table name: product_tags
#
#  id         :bigint(8)        not null, primary key
#  product_id :bigint(8)
#  tag_id     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :product_tag do
    product nil
    tag nil
  end
end
