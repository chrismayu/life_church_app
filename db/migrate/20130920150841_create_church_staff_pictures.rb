class CreateChurchStaffPictures < ActiveRecord::Migration
  def change
    create_table :church_staff_pictures do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.integer :church_staff_id
      t.boolean :image_processed 

      t.timestamps
    end
  end
end
