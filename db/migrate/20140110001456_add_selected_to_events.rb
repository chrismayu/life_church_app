class AddSelectedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :template_selected, :integer
  end
end
