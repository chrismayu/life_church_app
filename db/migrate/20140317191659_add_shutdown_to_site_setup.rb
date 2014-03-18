class AddShutdownToSiteSetup < ActiveRecord::Migration
  def change
    add_column :site_setups, :shutdown, :boolean
  end
end
