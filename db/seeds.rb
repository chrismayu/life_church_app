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
About.create!(:address => "547 Athlone Avenue", :postal_code => "N4S 7V8", :phone_number => "(519) 537-7700", :toll_free_phone_number => "1-888-857-LIFE", :city => "Woodstock") #5 ada N4S 7V8 Phone 1-888-857-LIFE 
puts 'DEFAULT Staff Rank'
StaffRank.create!(:category => "Pastor", :ranking => 1)
StaffRank.create!(:category => "Associate Pastor", :ranking => 2)
StaffRank.create!(:category => "Executive Assistant", :ranking => 3)
StaffRank.create!(:category => "Assistant", :ranking => 4)
StaffRank.create!(:category => "Departmental Staff", :ranking => 5)
StaffRank.create!(:category => "Volunteer", :ranking => 6)

 
 