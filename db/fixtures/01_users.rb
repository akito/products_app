User.seed(:id) do |s|
  s.id = 1
  s.name = "admin"
  s.email = "admin@test.com"
  s.password = "password"
  s.role = "admin"
  s.confirmed_at = Time.now - 100
end

User.seed(:id) do |s|
  s.id = 2
  s.name = "user01"
  s.email = "user01@test.com"
  s.password = "password"
  s.confirmed_at = Time.now - 100
end

User.seed(:id) do |s|
  s.id = 3
  s.name = "user02"
  s.email = "user02@test.com"
  s.password = "password"
  s.confirmed_at = Time.now - 100
end

User.seed(:id) do |s|
  s.id = 4
  s.name = "user03"
  s.email = "user03@test.com"
  s.password = "password"
  s.confirmed_at = Time.now - 100
end
