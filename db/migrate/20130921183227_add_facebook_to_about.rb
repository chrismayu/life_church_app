class AddFacebookToAbout < ActiveRecord::Migration
  def change
    add_column :abouts, :youtube, :string
    add_column :abouts, :facebook, :string
    add_column :abouts, :video_stream, :string
    add_column :abouts, :twitter, :string
    add_column :abouts, :country, :string
    add_column :abouts, :province, :string
  end
end
