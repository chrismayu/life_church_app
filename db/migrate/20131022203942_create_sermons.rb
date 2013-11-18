class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.date :date_of_sermon
      t.string :title
      t.text :description
      t.string :category
      t.string :audio_url
      t.string :video_url
      t.date :display_until
      t.integer :speaker_id
      t.boolean :members_only
      t.string :url

      t.timestamps
    end
  end
end
