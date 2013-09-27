class AddTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_start_time, :time
  end
end
