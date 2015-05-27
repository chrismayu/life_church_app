class AddEditorToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :editor, :boolean
  end
end
