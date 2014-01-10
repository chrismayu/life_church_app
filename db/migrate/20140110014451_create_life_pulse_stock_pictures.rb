class CreateLifePulseStockPictures < ActiveRecord::Migration
  def change
    create_table :life_pulse_stock_pictures do |t|
      t.integer :life_pulse_id
      t.string :life_pulse_image
      t.string :title
      t.string :summary
      t.boolean :image_processed
      t.boolean :main_page

      t.timestamps
    end
  end
end
