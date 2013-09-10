class About < ActiveRecord::Base
  attr_accessible :address, :city, :fax_number, :gmaps, :latitude, :longitude, :phone_number, :postal_code, :service_day_1, :service_day_2, :service_day_3, :service_time_1, :service_time_2, :service_time_3, :toll_free_phone_number
  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.city}, #{self.postal_code}" 
  end



end
