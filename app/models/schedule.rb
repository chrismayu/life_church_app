class Schedule < ActiveRecord::Base
  attr_accessible :description, :end_month, :image_processed, :name, :schedule_image, :slug, :start_month, :url
end
