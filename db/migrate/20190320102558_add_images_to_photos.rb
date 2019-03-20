class AddImagesToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :images, :string
  end
end
