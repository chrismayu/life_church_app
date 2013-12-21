class AddColorsToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :colours, :string
  end
end
