json.extract! product, :id, :name, :url, :desc, :image, :thumbnail, :created_at, :updated_at
json.url product_url(product, format: :json)
