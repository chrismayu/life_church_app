class AddImageToBulletin < ActiveRecord::Migration
  def change
    add_column :bulletins, :image_processed, :boolean
  end
end
