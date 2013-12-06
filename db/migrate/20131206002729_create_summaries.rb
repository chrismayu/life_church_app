class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :what_we_believe

      t.timestamps
    end
  end
end
