class CreateLifePulses < ActiveRecord::Migration
  def change
    create_table :life_pulses do |t|
      t.string :keywords
      t.boolean :from_pastor_desk
      t.integer :template_selected
      t.text :content
      t.string :title
      t.string :summary
      t.string :flickr_id

      t.timestamps
    end
  end
end
