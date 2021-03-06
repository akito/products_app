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

class ProductTag < ApplicationRecord
  belongs_to :product
  belongs_to :tag
end
