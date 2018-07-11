FactoryBot.define do
  factory :product do
    name 'My_Product'
    url 'https://example.com'
    desc 'this is my first product'
    image 'image_path'
    thumbnail 'thumbnail_path'
    user_id '1'
    likes_count '0'
  end
end
