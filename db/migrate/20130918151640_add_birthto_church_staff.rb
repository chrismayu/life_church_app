class AddBirthtoChurchStaff < ActiveRecord::Migration
  def up
    add_column :church_staffs, :birth_location, :string
    add_column :church_staffs, :category, :string
    add_column :church_staffs, :rank, :integer
  end

  def down
  end
end
