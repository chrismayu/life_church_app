class AddMoreToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :the_answer, :text
  end
end
