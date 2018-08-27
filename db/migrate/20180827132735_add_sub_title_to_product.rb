class AddSubTitleToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sub_title, :string
  end
end
