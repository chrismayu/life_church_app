class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.string :service_day_1
      t.string :service_time_1
      t.string :service_day_2
      t.string :service_time_2
      t.string :service_day_3
      t.string :service_time_3
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone_number
      t.string :toll_free_phone_number
      t.string :fax_number
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.string :youtube
      t.string :facebook
      t.string :video_stream
      t.string :twitter
      t.string :country
      t.string :province

      t.timestamps
    end
  end
end
