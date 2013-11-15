class AddSelectorToAbout < ActiveRecord::Migration
  def change
    add_column :abouts, :life_pulse, :boolean
    add_column :abouts, :leaders_blog, :boolean
    add_column :abouts, :store, :boolean
    add_column :abouts, :video, :boolean
    add_column :abouts, :articles, :boolean
  end
end
