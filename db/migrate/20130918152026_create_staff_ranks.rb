class CreateStaffRanks < ActiveRecord::Migration
  def change
    create_table :staff_ranks do |t|
      t.integer :ranking
      t.string :category

      t.timestamps
    end
  end
end
