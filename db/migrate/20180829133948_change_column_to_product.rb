class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :name, :string, null: true
    change_column :products, :desc, :text, null: true
  end
end
