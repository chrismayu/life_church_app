class ChangeSchedules < ActiveRecord::Migration
  def self.up
    change_column :schedules, :slug, :string, :null => true 
    change_column :schedules, :name, :string , :null => true
    change_column :schedules, :url, :string , :null => true
  end

 
end