ActiveAdmin.register Product do
  permit_params :name, :url, :desc, :image, :thumbnail, :status, :category_id, :sub_title, :ogpimage, :twitter, :advertisement
end
