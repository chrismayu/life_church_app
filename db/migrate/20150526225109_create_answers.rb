class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.boolean :admin, :default => true
      t.boolean :member_only, :default => false
      t.text :answer
      t.integer :faq_id, :null => false
      t.integer :user_id

      t.timestamps
    end
  end
end
