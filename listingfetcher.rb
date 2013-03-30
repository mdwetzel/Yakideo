class ListingFetcher  
  def initialize
  end

  def self.fetch(uri)
    doc = Nokogiri::HTML(open(uri))
    listings = []
    doc.css('html body blockquote p').each do |node|
      listing = Listing.new(node.css('a').text)
      listing.location = node.css('.itempn').text
      listings << listing
    end
    # Delete the 'next 100 postings' entry.
    
    listings.pop
    listings
  end
end