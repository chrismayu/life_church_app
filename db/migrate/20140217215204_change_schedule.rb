class ChangeSchedule < ActiveRecord::Migration
 
    def self.up
      change_column :schedules, :url, :string, :limit => 250, :null => true
    end

    def self.down
      change_column :schedules, :url, :string, :limit => 250 , :null => true
    end
  end
 