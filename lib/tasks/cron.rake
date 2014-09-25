desc "Run cron job"
task :cron => :environment do
  HomeScraper.new('http://www.homefinder.com/TN/Nashville/').find_homes
end
