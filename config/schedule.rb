# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
require 'whenever'
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every 1.day, :at => '5:15 pm' do
  runner "HomeScraper.new('http://www.homefinder.com/TN/Nashville/').find_homes", :output => 'cron.log'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
