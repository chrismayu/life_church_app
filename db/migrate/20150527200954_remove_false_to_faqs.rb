class RemoveFalseToFaqs < ActiveRecord::Migration
  def up
 
       change_column :faqs, :admin, :boolean, :default => false 
  end

  def down
      change_column :faqs, :admin, :boolean
  end
end
