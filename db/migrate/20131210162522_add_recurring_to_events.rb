class AddRecurringToEvents < ActiveRecord::Migration
  def change
    add_column :events, :recurring_day, :string
    add_column :events, :recurring_on, :boolean
  end
end
