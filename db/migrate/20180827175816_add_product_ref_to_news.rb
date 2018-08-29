class AddProductRefToNews < ActiveRecord::Migration[5.2]
  def change
    add_reference :news, :product, foreign_key: true
  end
end
