class AddFullnameToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :full_name, :string
  end
end
