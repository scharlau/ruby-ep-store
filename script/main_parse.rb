# file to call Amazon Product Advertising API and then dump items in database
# based upon the examples in the Ruby/AWS gem at
# http://www.caliban.org/ruby/ruby-aws/

#!/usr/bin/env ruby
RAILS_ENV = 'development'
require File.dirname(__FILE__) + '/../config/environment'
require 'amazon/aws/search'

# Avoid having to fully qualify our methods.
include Amazon::AWS
include Amazon::AWS::Search

is = ItemSearch.new( 'DVD', { 'Title' => 'Punk' } )

# I want to receive just a small amount of data for the items found.
is.response_group = ResponseGroup.new( :Small )
req = Request.new

# Make sure I'm talking to amazon.co.uk.
req.locale = 'uk'

# Actually talk to AWS.
resp = req.search( is )

# Drill down to the meat: the array of items returned.
items = resp.item_search_response[0].items[0].item
puts 'items size: ' + items.size.to_s

# The following alternative shorthand would also have worked:
# items = resp.item_search_response.items.item

# Available properties for first item:
puts items[0].properties

items.each do |item|  
  dvd = Dvd.new
  
  attribs = item.item_attributes[0]
  dvd.title = attribs.title.to_s
  # dvd.director = attribs.director
  dvd.detailsPageURL = item.detail_page_url.to_s
  dvd.ASIN = item.asin.to_s
  dvd.save!
  puts 'next DVD'
  puts 'asin: ' + dvd.ASIN
  puts 'detailsPageURL' + dvd.detailsPageURL
 # puts 'label: ' + attribs.label
  puts 'title: ' + dvd.title
 # puts 'director: ' + attribs.director
  
end


