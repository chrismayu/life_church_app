class CreateEgivings < ActiveRecord::Migration
  def change
    create_table :egivings do |t|
      t.integer :amount
      t.boolean :send_email_giver
      t.string :email_of_giver
      t.binary :name_on_card
      t.binary :name_on_card_key
      t.binary :name_on_card_iv
      t.binary :card_number
      t.binary :card_number_key
      t.binary :card_number_iv
      t.binary :ccv_number
      t.binary :ccv_number_key
      t.binary :ccv_number_iv
      t.binary :date_month
      t.binary :date_month_key
      t.binary :date_month_iv
      t.binary :date_year
      t.binary :date_year_key
      t.binary :date_year_iv
      t.string :giving
      t.integer :year
      t.string :card_type
      t.decimal :amountfinal, :precision => 8, :scale => 2
      t.string :propose_of_donation
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :postal_code
      t.string :phone_number
      t.float :finalamount

      t.timestamps
    end
  end
end
