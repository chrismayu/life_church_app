class AddChildrenidToMinistryChild < ActiveRecord::Migration
  def change
    add_column :ministry_children, :ministry_id, :integer
  end
end
