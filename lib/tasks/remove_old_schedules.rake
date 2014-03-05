desc "Remove Schedules older than a month"
task :remove_old_schedules => :environment do
  Schedule.where("created_at >= ?", 60.days.ago.to_datetime).each do |schedule|
    schedule.destroy
  end
  
end
