ProductTag.seed(:id) do |s|
  s.product_id = Product.find_by(name:"product01" ).id
  s.tag_id = Tag.find_by(label:"旅行" ).id
end

ProductTag.seed(:id) do |s|
  s.product_id = Product.find_by(name:"product01" ).id
  s.tag_id = Tag.find_by(label:"買い物" ).id
end

ProductTag.seed(:id) do |s|
  s.product_id = Product.find_by(name:"product02" ).id
  s.tag_id = Tag.find_by(label:"ファッション" ).id
end

ProductTag.seed(:id) do |s|
  s.product_id = Product.find_by(name:"product02" ).id
  s.tag_id = Tag.find_by(label:"生活" ).id
end

ProductTag.seed(:id) do |s|
  s.product_id = Product.find_by(name:"product03" ).id
  s.tag_id = Tag.find_by(label:"生活" ).id
end

ProductTag.seed(:id) do |s|
  s.product_id = Product.find_by(name:"product03" ).id
  s.tag_id = Tag.find_by(label:"旅行" ).id
end

ProductTag.seed(:id) do |s|
  s.product_id = Product.find_by(name:"product04" ).id
  s.tag_id = Tag.find_by(label:"買い物" ).id
end
