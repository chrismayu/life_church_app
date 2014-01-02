class AddSlugToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :slug, :string
    add_index :abouts, :slug 
  end
end
