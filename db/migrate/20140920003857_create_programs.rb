class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :program_name
      t.string :contact_email
      t.string :location
      t.string :contact_person
      t.text :description
      t.date :remove_program_date
      t.boolean :display_main_page 
      
      t.timestamps
    end
  end
end
