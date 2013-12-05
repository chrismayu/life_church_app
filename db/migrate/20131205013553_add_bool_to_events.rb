class AddBoolToEvents < ActiveRecord::Migration
  def change
    add_column :events, :use_form_button, :boolean
    add_column :events, :which_form, :integer
    add_column :events, :download_link, :string
    add_column :events, :share_download, :boolean
  end
end
