class CreateSiteSetups < ActiveRecord::Migration
  def change
    
    drop_table :site_setups
    
    create_table :site_setups do |t|
      t.string :youtube
      t.string :facebook
      t.string :video_stream
      t.string :twitter
      t.boolean :life_pulse
      t.boolean :leaders_blog
      t.boolean :store
      t.boolean :video
      t.boolean :articles

      t.timestamps
    end
  end
end
