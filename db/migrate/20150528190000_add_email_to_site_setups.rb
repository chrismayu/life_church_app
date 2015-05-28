class AddEmailToSiteSetups < ActiveRecord::Migration
  def change
    add_column :site_setups, :approval, :string
    add_column :site_setups, :general_questions, :string
    add_column :site_setups, :contact, :string
  end
end
