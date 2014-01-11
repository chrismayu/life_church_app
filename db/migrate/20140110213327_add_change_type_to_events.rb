class AddChangeTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :full_event, :boolean
    add_column :events, :event_type, :integer
    add_column :events, :summary, :string
    add_column :events, :force_on_main_page, :boolean
    add_column :events, :enable_disable_ad, :boolean
  end
end
