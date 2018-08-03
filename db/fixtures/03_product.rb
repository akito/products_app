Product.seed(:id) do |s|
  s.id = 1
  s.name = "product01"
  s.url = "https://product01.com"
  s.desc = "this is my first product"
  s.status = "published"
  s.category_id = Category.find_by(name: "category01").id
end

Product.seed(:id) do |s|
  s.id = 2
  s.name = "product02"
  s.url = "https://product02.com"
  s.desc = "this is my second product"
  s.status = "published"
  s.category_id = Category.find_by(name: "category01").id
end

Product.seed(:id) do |s|
  s.id = 3
  s.name = "product03"
  s.url = "https://product03.com"
  s.desc = "this is my third product"
  s.status = "published"
  s.category_id = Category.find_by(name: "category03").id
end

Product.seed(:id) do |s|
  s.id = 4
  s.name = "product04"
  s.url = "https://product04.com"
  s.desc = "this is a product"
  s.status = "draft"
  s.category_id = Category.find_by(name: "category02").id
end

Product.seed(:id) do |s|
  s.id = 5
  s.name = "product05"
  s.url = "https://product05.com"
  s.desc = "this is a product"
  s.status = "archived"
  s.category_id = Category.find_by(name: "category03").id
end

Product.seed(:id) do |s|
  s.id = 6
  s.name = "product06"
  s.url = "https://product06.com"
  s.desc = "this is my product"
  s.status = "published"
  s.category_id = Category.find_by(name: "category01").id
end

Product.seed(:id) do |s|
  s.id = 7
  s.name = "product07"
  s.url = "https://product07.com"
  s.desc = "this is my product"
  s.status = "published"
  s.category_id = Category.find_by(name: "category01").id
end

Product.seed(:id) do |s|
  s.id = 8
  s.name = "product08"
  s.url = "https://product08.com"
  s.desc = "this is my product"
  s.status = "published"
  s.category_id = Category.find_by(name: "category01").id
end

Product.seed(:id) do |s|
  s.id = 9
  s.name = "product09"
  s.url = "https://product09.com"
  s.desc = "this is my product"
  s.status = "published"
  s.category_id = Category.find_by(name: "category01").id
end
#
# 100.times do |i |
#   Product.seed(:id) do |s|
#     s.id = i + 10
#     s.name = "product#{i + 10}"
#     s.url = "https://product#{i + 10}.com"
#     s.desc = "this is my product"
#     s.image = "product#{i + 10}"
#     s.category_id = Category.find_by(name: "category01").id
#   end
# end
