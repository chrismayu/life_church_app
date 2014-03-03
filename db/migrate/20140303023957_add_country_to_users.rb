class AddCountryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country_selected, :string
  end
end
