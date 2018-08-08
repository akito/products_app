# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  label      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_many :product_tags
  has_many :products, through: :product_tags
end
