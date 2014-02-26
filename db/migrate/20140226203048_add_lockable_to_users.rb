class AddLockableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :failed_attempts, :integer, default: 0
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :postal_code, :string
    add_column :users, :birthday, :date
    add_column :users, :home_phone, :string
    add_column :users, :cell_phone, :string
    add_column :users, :gender, :string
  end
end
