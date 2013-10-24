class AddBdayToChurchStaff < ActiveRecord::Migration
  def change
    add_column :church_staffs, :birthday, :date
    add_column :church_staffs, :blog, :string
    add_column :church_staffs, :url, :string
    add_column :church_staffs, :phone_ext, :integer
    add_column :church_staffs, :phone_number, :string
    add_column :church_staffs, :full_name, :string
    add_column :church_staffs, :email_id, :string
    add_column :church_staffs, :facebook, :string
    add_column :church_staffs, :twitter, :string
    add_column :church_staffs, :google_plus, :string
    add_column :church_staffs, :linked_in, :string
    add_column :church_staffs, :birth_location, :string
    add_column :church_staffs, :category, :string
    add_column :church_staffs, :rank, :integer
  end
end
