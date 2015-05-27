class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :title
      t.integer :user_id
      t.boolean :admin, :default => true
      t.boolean :member_only, :default => false
      t.integer :answer

      t.timestamps
    end
  end
end
