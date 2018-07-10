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
  validates :user_id, presence: true
  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def owned_by?(user)
    self.user_id == user.id
  end

  def like?(user)
    self.likes.find_by(user_id: user.id)
  end
end
