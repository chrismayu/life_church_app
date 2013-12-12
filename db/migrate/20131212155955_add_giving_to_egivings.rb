class AddGivingToEgivings < ActiveRecord::Migration
  def change
    add_column :egivings, :giving_year, :integer
  end
end
