class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.string :name
      t.text :description
      t.date :display_till
      t.date :display_start
      t.boolean :advert_main_page
      t.string :bulletin_image
      t.string :url
      t.boolean :members_only

      t.timestamps
    end
  end
end
