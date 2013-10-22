class Speaker < ActiveRecord::Base
  attr_accessible :church_staff_id, :description, :first_name, :from_church, :from_church_url, :last_name, :title
end
