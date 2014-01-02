class AddSlugToMinistries < ActiveRecord::Migration
  def change
    add_column :ministries, :slug, :string
    add_index :ministries, :slug 
  end
end
