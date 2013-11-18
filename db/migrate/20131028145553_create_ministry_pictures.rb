class CreateMinistryPictures < ActiveRecord::Migration
  def change
    create_table :ministry_pictures do |t|
      t.string :ministry_image
      t.boolean :image_processed
      t.integer :ministries_id
      t.integer :ministry_id

      t.timestamps
    end
  end
end
