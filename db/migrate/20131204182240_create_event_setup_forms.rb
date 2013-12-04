class CreateEventSetupForms < ActiveRecord::Migration
  def change
    create_table :event_setup_forms do |t|
      t.integer :event_id
      t.string :email_for_forms
      t.string :c_f_1
      t.string :c_f_2
      t.string :c_f_3
      t.string :c_f_4
      t.string :c_f_5
      t.string :c_f_6
      t.string :c_f_7
      t.string :c_f_8
      t.string :c_f_9
      t.string :c_f_10
      t.string :c_f_11
      t.string :c_f_12
      t.boolean :age
      t.string :c_f_1_h
      t.string :c_f_2_h
      t.string :c_f_3_h
      t.string :c_f_4_h
      t.string :c_f_5_h
      t.string :c_f_6_h
      t.string :c_f_7_h
      t.string :c_f_8_h
      t.string :c_f_9_h
      t.string :c_f_10_h
      t.string :c_f_11_h
      t.string :c_f_12_h
      t.boolean :phone
      t.boolean :note
      t.boolean :bday
      t.boolean :sex
      t.boolean :use_form
      t.string :down_link
      t.boolean :ok_to_contact
      t.string :form_title

      t.timestamps
    end
  end
end
