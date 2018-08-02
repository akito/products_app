ActiveAdmin.register Product do
  permit_params :name, :url, :desc, :image, :thumbnail, :status
end
