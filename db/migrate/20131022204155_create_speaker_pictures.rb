class CreateSpeakerPictures < ActiveRecord::Migration
  def change
    create_table :speaker_pictures do |t|
      t.string :speaker_image
      t.integer :speaker_id
      t.boolean :image_processed

      t.timestamps
    end
  end
end
