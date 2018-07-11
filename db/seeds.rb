# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


3.times do |id|
  idx = id + 1
  User.create!(name: "user0#{idx}", email: "user0#{idx}@example.com", password: 'password')
  Product.create!(name: "product0#{idx}",
                  url: "https://www.example0#{idx}.com",
                  desc: 'ピンボード風の写真共有ウェブサイト',
                  image: "product0#{idx}",
                  thumbnail: "product0#{idx}",
                  user_id: User.find_by(email: "user0#{idx}@example.com"))
end
