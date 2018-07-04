class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.text :desc
      t.string :image
      t.string :thumbnail

      t.timestamps
    end
  end
end
