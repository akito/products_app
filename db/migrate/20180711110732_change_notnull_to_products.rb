class ChangeNotnullToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :url, false
    change_column_null :products, :desc, false
  end
end
