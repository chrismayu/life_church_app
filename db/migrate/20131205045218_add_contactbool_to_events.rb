class AddContactboolToEvents < ActiveRecord::Migration
  def change
    add_column :events, :use_contact, :boolean
  end
end
