class CreateMinistryPictureChildren < ActiveRecord::Migration
  def change
    create_table :ministry_picture_children do |t|
      t.string :ministrychild_image
      t.boolean :image_processed
      t.integer :ministrychild_id

      t.timestamps
    end
  end
end
