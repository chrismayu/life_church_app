class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :yes_receive_email, :boolean
  end
end
