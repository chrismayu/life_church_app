desc "Remove Bulletins older than a month"
task :remove_old_bulletins => :environment do 
  Bulletin.where("display_start >= ?", 60.days.ago.to_datetime).each do |bulletin| 
    bulletin.destroy 
  end 
end