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
  has_many :product_tags
  has_many :tags, through: :product_tags


  enum status: { draft: 0, published: 1, archived: 2 }

  def like_by(user)
    likes.find_by(user_id: user.id)
  end

  def liked?(user)
    likes.exists?(user_id: user.id)
  end

  def add_tags(labels)
    self.tags = []
    labels.each do | label |
      if Tag.find_by(label: label)
        self.tags << Tag.find_by(label: label)
      else
        self.tags << Tag.create(label: label)
      end
    end
  end

  def tags_to_s
    tags.pluck(:label).join(' ')
  end
end
