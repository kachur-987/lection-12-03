class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
