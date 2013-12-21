class AddColorToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :green, :boolean
  end
end
