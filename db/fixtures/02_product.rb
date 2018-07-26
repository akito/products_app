Product.seed(:id) do |s|
  s.id = 1
  s.name = "product01"
  s.url = "https://product01.com"
  s.desc = "this is my first product"
  s.image = "product01"
  s.thumbnail = "product01"
  s.user_id = User.find_by(name:'admin')
  s.status = "published"
end

Product.seed(:id) do |s|
  s.id = 2
  s.name = "product02"
  s.url = "https://product02.com"
  s.desc = "this is my second product"
  s.image = "product02"
  s.thumbnail = "product02"
  s.user_id = User.find_by(name:'user01')
  s.status = "published"
end

Product.seed(:id) do |s|
  s.id = 3
  s.name = "product03"
  s.url = "https://product03.com"
  s.desc = "this is my third product"
  s.image = "product03"
  s.thumbnail = "product03"
  s.user_id = User.find_by(name:'user02')
  s.status = "published"
end

Product.seed(:id) do |s|
  s.id = 4
  s.name = "product04"
  s.url = "https://product04.com"
  s.desc = "this is a product"
  s.image = "product04"
  s.thumbnail = "product04"
  s.user_id = User.find_by(name:'user03')
  s.status = "draft"
end

Product.seed(:id) do |s|
  s.id = 5
  s.name = "product05"
  s.url = "https://product05.com"
  s.desc = "this is a product"
  s.image = "product05"
  s.thumbnail = "product05"
  s.user_id = User.find_by(name:'user03')
  s.status = "archived"
end