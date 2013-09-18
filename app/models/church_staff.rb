class ChurchStaff < ActiveRecord::Base
  attr_accessible :contact_email, :birth_location, :category, :rank, :description, :first_name, :image, :last_name, :spouse_first_name, :started_service, :title
end
