class CreateSiteSetups < ActiveRecord::Migration
  def change
    create_table :site_setups do |t|

      t.timestamps
    end
  end
end
