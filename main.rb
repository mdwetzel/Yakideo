require_relative 'requires'

print "Enter the url of the craigslist section to monitor: "
watch_url = gets.chomp
# http:// in case the user hasn't. 
unless watch_url =~ /^http:\/\//i 
  watch_url = 'http://' + watch_url
end

unless watch_url =~ /.craigslist.org\/\w{3}/i
  puts "Invalid craigslist url!"
end

print "Enter the keyword to monitor: "
keyword = gets.chomp

while true
  listings = ListingFetcher.fetch(watch_url)

  results = listings.select { |obj| obj.title =~ /#{keyword}/i }

  puts "Found #{results.length} results:"
  results.each do |result|
    puts result
  end

  puts "Sleeping for #{Config::GENERAL[:update_time]} seconds"
  sleep Config::GENERAL[:update_time]
end

mailer = Mailer.new
mailer.send_mail 