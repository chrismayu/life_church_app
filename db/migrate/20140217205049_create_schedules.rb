class CreateSchedules < ActiveRecord::Migration
  def change
    
    drop_table :schedules
    
    
    create_table :schedules do |t|
      t.string :name 
      t.text :description
      t.date :end_month
      t.date :start_month
      t.string :schedule_image
      t.boolean :image_processed
      t.string :slug 
      t.string :url 

      t.timestamps
    end
  end
end
