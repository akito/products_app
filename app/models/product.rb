# == Schema Information
#
# Table name: products
#
#  id            :bigint(8)        not null, primary key
#  name          :string           not null
#  url           :string           not null
#  desc          :text             not null
#  image         :string
#  thumbnail     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likes_count   :integer          default(0), not null
#  status        :integer          default("draft"), not null
#  category_id   :bigint(8)
#  ogpimage      :string
#  sub_title     :string
#  twitter       :string
#  advertisement :integer          default("no"), not null
#

class Product < ApplicationRecord
  include Ownable
  validates :url, presence: true, uniqueness: { case_sensitive: false }, format: /\A#{URI.regexp(%w[http https])}\z/

  belongs_to :category, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :product_tags
  has_many :tags, through: :product_tags, dependent: :destroy
  has_many :new, dependent: :destroy

  scope :created_after, ->(time) { where("created_at > ?", time) if time.present? }
  scope :like_ranking, ->(num) { where("likes_count > 0").order(likes_count: :desc).limit(num) if num.present? }
  scope :random, ->(num) { where(id: pluck(:id).sample(num)) }

  enum status: { draft: 0, published: 1, archived: 2 }
  enum advertisement: { no: 0, yes: 1 }

  mount_uploader :thumbnail, ThumbnailUploader

  def like_by(user)
    likes.find_by(user_id: user.id)
  end

  def liked?(user)
    likes.exists?(user_id: user.id)
  end

  def add_tags(labels)
    self.tags = []
    labels.uniq.each do | label |
      if Tag.find_by(label: label)
        self.tags << Tag.find_by(label: label)
      else
        self.tags << Tag.create(label: label)
      end
    end
  end

  def tags_to_s
    tags.pluck(:label).join(" ")
  end

  def related_products(max)
    Product.published.where(category_id: category_id).where.not(id: id).limit(max)
  end

  def fetch_info
    page = MetaInspector.new(url, faraday_options: { ssl: { verify: false } })
    if url.match(/^http:\/\/.*/) then
      url.sub!("http://", "https://")
    end
    binding.pry
    self.name = page.title.empty? ? page.best_title : page.title
    self.sub_title = page.title.empty? ? nil : page.title
    self.ogpimage = page.images.best.empty? ? nil : page.images.best
    if self.ogpimage.match(/^http:\/\/.*/) then
      self.ogpimage.sub!("http://", "https://")
    end
    self.image = page.images.favicon.empty? ? nil : page.images.favicon
    if self.image.match(/^http:\/\/.*/) then
      self.image.sub!("http://", "https://")
    end
    self.desc = page.best_description.empty? ? page.description : page.best_description
  end
end
