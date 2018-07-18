# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#  product_id :bigint(8)        not null
#

class Comment < ApplicationRecord
  include Ownable

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :product
end
