class AddIdToEventPictures < ActiveRecord::Migration
  def change
    add_column :event_pictures, :event_id, :integer
    add_column :event_pictures, :eventimage, :string
    add_column :event_pictures, :image_processed, :boolean
  end
end
