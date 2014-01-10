class AddSlugToLifePulses < ActiveRecord::Migration
  def change
     add_column :life_pulses, :slug, :string
     add_index :life_pulses, :slug, unique: true
 
  end
end
