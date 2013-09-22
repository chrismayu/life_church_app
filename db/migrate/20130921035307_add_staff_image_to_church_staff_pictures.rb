class AddStaffImageToChurchStaffPictures < ActiveRecord::Migration
  def change
    add_column :church_staff_pictures, :staff_image, :string
  end
end
