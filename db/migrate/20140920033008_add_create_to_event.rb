class AddCreateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :create_own_page, :boolean, :default => false
  end
end
