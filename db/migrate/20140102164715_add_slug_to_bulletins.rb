class AddSlugToBulletins < ActiveRecord::Migration
  def change
    add_column :bulletins, :slug, :string
    add_index :bulletins, :slug 
  end
end
