class AddBdayToChurchStaff < ActiveRecord::Migration
  def change
    add_column :church_staffs, :birthday, :date
    add_column :church_staffs, :blog, :string
    add_column :church_staffs, :url, :string
    add_column :church_staffs, :phone_ext, :integer
    add_column :church_staffs, :phone_number, :string
  end
end
