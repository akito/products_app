class ChangeNotnullToLikes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :likes, :user_id, false
    change_column_null :likes, :product_id, false
  end
end
