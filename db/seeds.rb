# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
puts 'DEFAULT CHURCH ADDRESS'
About.create!(:address => "547 Athlone Avenue", :postal_code => "N4S 7V8", :facebook =>"https://www.facebook.com/LifeInYou", :twitter =>"https://twitter.com/ChrisReeftank", :youtube => "http://new.livestream.com/accounts/1715194/events/1680559", :phone_number => "(519) 537-7700", :toll_free_phone_number => "1-888-857-LIFE", :city => "Woodstock", :province => "Ontario", :country => "Canada") #5 ada N4S 7V8 Phone 1-888-857-LIFE 
puts 'DEFAULT Staff Rank'
StaffRank.create!(:category => "Pastor", :ranking => 1)
StaffRank.create!(:category => "Associate Pastor", :ranking => 2)
StaffRank.create!(:category => "Executive Assistant", :ranking => 3)
StaffRank.create!(:category => "Assistant", :ranking => 4)
StaffRank.create!(:category => "Departmental Staff", :ranking => 5)
StaffRank.create!(:category => "Volunteer", :ranking => 6)
puts 'DEFAULT Service Times'
ServiceTime.create!(:day => "Tuesday", :service_name => "Tuesday Morning Prayer", :start_time => "09/24/2013 07:30")
ServiceTime.create!(:day => "Sunday", :service_name => "Sunday Morning Service", :start_time => "09/24/2013 10:00")
ServiceTime.create!(:day => "Wednesday", :service_name => "Wednesday Night Service", :start_time => "09/24/2013 19:30")
puts 'DEFAULT Staff'
ChurchStaff.create!(:first_name => "Thomas", :last_name => "Zimmerman", :birthday => DateTime.new(2013,9,1,17), :title =>"Pastor", :started_service => DateTime.new(2013,9,1,17))
ChurchStaff.create!(:first_name => "Jason", :last_name => "Tucker", :birthday => DateTime.new(2013,9,1,17), :title =>"Youth Pastor", :started_service => DateTime.new(2013,9,1,17))
puts 'DEFAULT Events'
Event.create!(:contact_email=>"chrismayu@gmail.com", :contact_person =>"Chris Mayu", :description=>"Shortest Description Ever!!", :event_time => "19:30", :event_start_time => DateTime.new(2013,9,1,17),  :event_date => DateTime.new(2013,9,1,17), :event_name => "Christmas Dinner", :location =>"LifeChuch", :remove_event_date => DateTime.new(2015,9,1,17))
Event.create!(:contact_email=>"chrismayu@gmail.com", :contact_person =>"Chris Mayu", :description=>"Shortest Description Ever!!", :event_time => "19:30", :event_start_time => DateTime.new(2013,9,1,17),  :event_date => DateTime.new(2013,9,1,17), :event_name => "Easter Service", :location =>"LifeChuch", :remove_event_date => DateTime.new(2015,9,1,17))
Event.create!(:contact_email=>"chrismayu@gmail.com", :contact_person =>"Chris Mayu", :description=>"Shortest Description Ever!!", :event_time => "19:30", :event_start_time => DateTime.new(2013,9,1,17),  :event_date => DateTime.new(2013,9,1,17), :event_name => "Guest Speaker", :location =>"LifeChuch", :remove_event_date => DateTime.new(2015,9,1,17))
Event.create!(:contact_email=>"chrismayu@gmail.com", :contact_person =>"Chris Mayu", :description=>"Shortest Description Ever!!", :event_time => "19:30", :event_start_time => DateTime.new(2013,9,1,17),  :event_date => DateTime.new(2013,9,1,17), :event_name => "Chris' B-Day", :location =>"LifeChuch", :remove_event_date => DateTime.new(2015,9,1,17))
Event.create!(:contact_email=>"chrismayu@gmail.com", :contact_person =>"Chris Mayu", :description=>"Shortest Description Ever!!", :event_time => "19:30", :event_start_time => DateTime.new(2013,9,1,17),  :event_date => DateTime.new(2013,9,1,17), :event_name => "Summer Picnic", :location =>"LifeChuch", :remove_event_date => DateTime.new(2015,9,1,17))
Event.create!(:contact_email=>"chrismayu@gmail.com", :contact_person =>"Chris Mayu", :description=>"Shortest Description Ever!!", :event_time => "19:30", :event_start_time => DateTime.new(2013,9,1,17),  :event_date => DateTime.new(2013,9,1,17), :event_name => "Chuch Cleanning Bee", :location =>"LifeChuch", :remove_event_date => DateTime.new(2015,9,1,17))
puts 'DEFAULT Guest Speakers'
Speaker.create!(:first_name => "Thomas", :last_name => "Zimmerman", :from_church=>"LifeChurch", :description=>"Shortest Description Ever!!", :title =>"Pastor" )
Speaker.create!(:first_name => "Jason", :last_name => "Tucker", :from_church=>"LifeChurch", :description=>"Shortest Description Ever!!", :title =>"Youth Pastor" )
Speaker.create!(:first_name => "Colin", :last_name => "Nanton", :from_church=>"LifeChurch", :description=>"Shortest Description Ever!!", :title =>"User" )
Speaker.create!(:first_name => "David", :last_name => "McGrew", :from_church=>"BC", :description=>"Shortest Description Ever!!", :title =>"Pastor" )




 
 
 