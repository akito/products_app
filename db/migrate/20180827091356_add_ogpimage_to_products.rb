class AddOgpimageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ogpimage, :string
  end
end
