class CreateSermonPictures < ActiveRecord::Migration
  def change
    create_table :sermon_pictures do |t|
      t.string :sermon_image
      t.boolean :image_processed
      t.integer :sermons_id

      t.timestamps
    end
  end
end
