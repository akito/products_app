# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  product_id :bigint(8)
#

class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :product_id, presence: true
  belongs_to :user
  belongs_to :product
end
