class CreateChurchStaffs < ActiveRecord::Migration
  def change
    create_table :church_staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :spouse_first_name
      t.string :title
      t.date :started_service
      t.text :description
      t.string :contact_email
      t.string :image

      t.timestamps
    end
  end
end
