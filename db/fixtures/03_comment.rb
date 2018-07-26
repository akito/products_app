Comment.seed(:id) do |s|
  s.id = 1
  s.user_id = User.find_by(email: "user01@test.com").id
  s.product_id = Product.find_by(name: "product01").id
  s.content = "good!"
end

Comment.seed(:id) do |s|
  s.id = 2
  s.user_id = User.find_by(email: "user01@test.com").id
  s.product_id = Product.find_by(name: "product02").id
  s.content = "good!"
end

Comment.seed(:id) do |s|
  s.id = 3
  s.user_id = User.find_by(email: "user01@test.com").id
  s.product_id = Product.find_by(name: "product03").id
  s.content = "good!"
end

Comment.seed(:id) do |s|
  s.id = 4
  s.user_id = User.find_by(email: "user02@test.com").id
  s.product_id = Product.find_by(name: "product01").id
  s.content = "so good!"
end

Comment.seed(:id) do |s|
  s.id = 5
  s.user_id = User.find_by(email: "user02@test.com").id
  s.product_id = Product.find_by(name: "product02").id
  s.content = "so good!"
end


Comment.seed(:id) do |s|
  s.id = 6
  s.user_id = User.find_by(email: "user02@test.com").id
  s.product_id = Product.find_by(name: "product03").id
  s.content = "so good!"
end

Comment.seed(:id) do |s|
  s.id = 7
  s.user_id = User.find_by(email: "user03@test.com").id
  s.product_id = Product.find_by(name: "product01").id
  s.content = "Excellent!"
end

Comment.seed(:id) do |s|
  s.id = 8
  s.user_id = User.find_by(email: "user03@test.com").id
  s.product_id = Product.find_by(name: "product02").id
  s.content = "Excellent!"
end

Comment.seed(:id) do |s|
  s.id = 9
  s.user_id = User.find_by(email: "user03@test.com").id
  s.product_id = Product.find_by(name: "product03").id
  s.content = "Excellent"
end