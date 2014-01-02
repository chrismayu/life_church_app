class AddNameToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :name, :string
  end
end
