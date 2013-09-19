class AddTwittertoChurchStaff < ActiveRecord::Migration
  def up
    add_column :church_staffs, :facebook, :string
    add_column :church_staffs, :twitter, :string
    add_column :church_staffs, :google_plus, :string
    add_column :church_staffs, :linked_in, :string
  end

  def down
  end
end
 