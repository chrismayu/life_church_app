class CreateServiceTimes < ActiveRecord::Migration
  def change
    create_table :service_times do |t|
      t.string :day
      t.time :start_time
      t.time :end_time
      t.string :service_name

      t.timestamps
    end
  end
end
