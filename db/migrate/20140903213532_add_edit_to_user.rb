class AddEditToUser < ActiveRecord::Migration
  def change
    add_column :users, :edit_site, :boolean, default: false
  end
end
