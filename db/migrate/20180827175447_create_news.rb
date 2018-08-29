class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.string :url
      t.string :media
      t.string :description

      t.timestamps
    end
  end
end
