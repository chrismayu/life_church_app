class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :contact_person
      t.string :contact
      t.string :_email
      t.text :description
      t.integer :display_rank
      t.text :ta1
      t.text :ta2
      t.text :ta3
      t.text :ta4
      t.text :ta5
      t.boolean :advert_main_page
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
