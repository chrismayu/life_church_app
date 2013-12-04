class CreateEventForms < ActiveRecord::Migration
  def change
    create_table :event_forms do |t|
      t.integer :event_setup_form_id
      t.string :first_name
      t.string :last_name
      t.string :receive_emails
      t.string :email
      t.string :phone_number
      t.text :notes
      t.string :c_f_1_s
      t.string :c_f_2_s
      t.string :c_f_3_s
      t.string :c_f_4_s
      t.boolean :c_f_5_b
      t.boolean :c_f_6_b
      t.boolean :c_f_7_b
      t.boolean :c_f_8_b
      t.text :c_f_9_t
      t.text :c_f_10_t
      t.text :c_f_11_t
      t.text :c_f_12_t
      t.integer :age
      t.date :bday
      t.string :sex

      t.timestamps
    end
  end
end
