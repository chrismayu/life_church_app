class AddEmailIdToChurchStaff < ActiveRecord::Migration
  def change
    add_column :church_staffs, :email_id, :string
  end
end
