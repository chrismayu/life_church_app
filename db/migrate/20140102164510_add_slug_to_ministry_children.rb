class AddSlugToMinistryChildren < ActiveRecord::Migration
  def change
    add_column :ministry_children, :slug, :string
    add_index :ministry_children, :slug 
  end
end
