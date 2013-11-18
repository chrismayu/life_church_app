class ServiceTime < ActiveRecord::Base
  attr_accessible :day, :end_time, :service_name, :start_time
  
  
  validates :service_name, presence: true 
  
   default_scope order: 'service_times.day ASC'
end
