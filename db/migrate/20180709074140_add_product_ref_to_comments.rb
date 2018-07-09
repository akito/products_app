class AddProductRefToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :product, foreign_key: true
  end
end
