require 'nokogiri'
require 'open-uri'
require_relative 'listing'
require_relative 'listingfetcher'

listings = ListingFetcher.fetch("http://portland.craigslist.org/sof")

listings.each  { |listing| puts listing }