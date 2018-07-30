class RemoveUserFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :user, foreign_key: true
  end
end
