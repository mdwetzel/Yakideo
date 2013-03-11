require 'nokogiri'
require 'open-uri'
require_relative 'listing'

doc = Nokogiri::HTML(open("http://portland.craigslist.org/sof"))

listings = []

doc.css('html body blockquote p').each do |node|
  listing = Listing.new(node.css('a').text)
  listing.location = node.css('.itempn').text
  listings << listing

end

# Delete the 'next 100 postings' entry.
listings.pop

listings.each  { |listing| puts listing }