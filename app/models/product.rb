# == Schema Information
#
# Table name: products
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  url        :string
#  desc       :text
#  image      :string
#  thumbnail  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Product < ApplicationRecord
  belongs_to :user, optional: true
end
