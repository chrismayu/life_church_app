class AddSstockToLifePulseStockPictures < ActiveRecord::Migration
  def change
    add_column :life_pulse_stock_pictures, :life_pulse_stock_image, :string
  end
end
