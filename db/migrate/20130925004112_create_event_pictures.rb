class CreateEventPictures < ActiveRecord::Migration
  def change
    create_table :event_pictures do |t|
      t.string :title
      t.string :event_image
      t.string :linked_event
      t.text :description

      t.timestamps
    end
  end
end
