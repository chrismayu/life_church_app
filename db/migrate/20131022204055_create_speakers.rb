class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :from_church
      t.text :description
      t.integer :church_staff_id
      t.string :from_church_url

      t.timestamps
    end
  end
end
