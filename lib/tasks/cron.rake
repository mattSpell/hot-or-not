desc "Run cron job"
task :cron => :environment do
  HomeScraper.new('http://www.homefinder.com/TN/Nashville/property-type-single-family-home/min-price-40000/max-price-400000/').find_homes
  HomeScraper.new('http://www.homefinder.com/TN/Nashville/property-type-townhouse/').find_homes
end
