class CreateServiceTimes < ActiveRecord::Migration
  def change
    create_table :service_times do |t|
      t.string :day
      t.string :start_time
      t.string :end_time
      t.string :service_name

      t.timestamps
    end
  end
end
