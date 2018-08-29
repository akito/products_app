# == Schema Information
#
# Table name: news
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  image       :string
#  url         :string
#  media       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint(8)
#

FactoryBot.define do
  factory :news, class: 'New' do
    title "MyString"
    image "MyString"
    url "MyString"
    media "MyString"
    description "MyString"
  end
end
