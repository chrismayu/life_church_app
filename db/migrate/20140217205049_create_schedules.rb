class CreateSchedules < ActiveRecord::Migration
  def change
    
    drop_table :schedules
    
    
    create_table :schedules do |t|
      t.string :name, :limit => 250, :null => false
      t.text :description
      t.date :end_month
      t.date :start_month
      t.string :schedule_image
      t.boolean :image_processed
      t.string :slug, :limit => 250, :null => false
      t.string :url, :limit => 250, :null => false

      t.timestamps
    end
  end
end
