class DropAboutsToAbout < ActiveRecord::Migration
  def up
    
    drop_table :abouts
  end

  def down
  end
end
