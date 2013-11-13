class About < ActiveRecord::Base
  attr_accessible :address, :city, :fax_number, 	:youtube, :facebook,   :video_stream,   :twitter,  :country,  :province,  :gmaps, :latitude, :longitude, :phone_number, :postal_code, :service_day_1, :service_day_2, :service_day_3, :service_time_1, :service_time_2, :service_time_3, :toll_free_phone_number
  acts_as_gmappable
  
  
  
  

  validates :phone_number, format: { with: /1?\W*([2-9][0-8][0-9])\W*([2-9][0-9]{2})\W*([0-9]{4})(\se?x?t?(\d*))?/, message: "Incorrect format or Missing" }  
  
  

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.city}, #{self.postal_code}" 
  end

  def prod_img_full
    "twitter.jpg"
  end

  def prod_img_over
    "twitter-hover.jpg"
  end

end
