# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  product_id :bigint(8)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
