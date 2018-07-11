User.seed(:id) do |s|
  s.id = 1
  s.name = "user01"
  s.email = "user01@test.com"
  s.password = "password"
end

User.seed(:id) do |s|
  s.id = 2
  s.name = "user02"
  s.email = "user02@test.com"
  s.password = "password"
end

User.seed(:id) do |s|
  s.id = 3
  s.name = "user03"
  s.email = "user03@test.com"
  s.password = "password"
end