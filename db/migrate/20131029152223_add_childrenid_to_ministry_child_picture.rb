class AddChildrenidToMinistryChildPicture < ActiveRecord::Migration
  def change
    add_column :ministry_picture_children, :ministry_id, :integer
  end
end
