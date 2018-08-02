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
#  likes_count :integer          default(0), not null
#  status      :integer          default("draft"), not null
#  category_id :bigint(8)
#

class Product < ApplicationRecord
  include Ownable
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, uniqueness: { case_sensitive: false }
  validates :desc, presence: true

  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :created_after, ->(time) { where('created_at > ?', time) if time.present? }
  scope :like_ranking, ->(num) { where('likes_count > 0').order(likes_count: :desc).limit(num) if num.present? }

  enum status: { draft: 0, published: 1, archived: 2 }

  def like_by(user)
    likes.find_by(user_id: user.id)
  end

  def liked?(user)
    likes.exists?(user_id: user.id)
  end

  def related_products(max)
    Product.where(category_id: self.category_id).where.not(id: self.id).limit(max)
  end
end
