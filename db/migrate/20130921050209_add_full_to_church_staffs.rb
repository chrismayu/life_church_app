class AddFullToChurchStaffs < ActiveRecord::Migration
  def change
    add_column :church_staffs, :full_name, :string
  end
end
