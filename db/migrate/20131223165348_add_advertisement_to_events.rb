class AddAdvertisementToEvents < ActiveRecord::Migration
  def change
    add_column :events, :advertisement, :boolean
    add_column :events, :internal_link_url, :string
    add_column :events, :internal_link, :boolean
    add_column :events, :no_expiry, :boolean
  end
end
