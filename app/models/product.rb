# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  url         :string           not null
#  desc        :text             not null
#  image       :string
#  thumbnail   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#  likes_count :integer          default(0), not null
#  status      :integer          default("draft"), not null
#  status      :integer          default(0), not null
#  category_id :bigint(8)


class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, uniqueness: { case_sensitive: false }
  validates :desc, presence: true

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  include Ownable
  enum status: { draft: 0, published: 1, archived: 2 }

  def liked?(user)
    !!likes.find_by(user_id: user.id)
  end

  def like(user)
    likes.find_by(user_id: user.id)
  end
end
