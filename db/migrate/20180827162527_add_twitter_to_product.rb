class AddTwitterToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :twitter, :string
  end
end
