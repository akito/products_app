Product.seed(:id) do |s|
  s.id = 1
  s.name = "product01"
  s.url = "https://product01.com"
  s.desc = "this is my first product"
  s.image = "product01"
  s.thumbnail = "product01"
  s.user_id = 1
end

Product.seed(:id) do |s|
  s.id = 2
  s.name = "product02"
  s.url = "https://product02.com"
  s.desc = "this is my second product"
  s.image = "product02"
  s.thumbnail = "product02"
  s.user_id = 2
end

Product.seed(:id) do |s|
  s.id = 3
  s.name = "product03"
  s.url = "https://product03.com"
  s.desc = "this is my third product"
  s.image = "product03"
  s.thumbnail = "product03"
  s.user_id = 3
end