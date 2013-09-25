class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.string :event_time
      t.string :contact_email
      t.string :location
      t.string :contact_person
      t.text :description
      t.date :remove_event_date
      t.boolean :display_main_page

      t.timestamps
    end
  end
end
