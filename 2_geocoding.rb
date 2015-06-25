# Activate some helpful built-in Ruby libraries
require 'open-uri'
require 'json'

# Our classroom location
location = "5555 South Ellis Avenue, Chicago, Illinois, 60637"

# Convert to an HTTP-compatible querystring parameter
location = URI.escape(location)

# Send an HTTP request to Google
json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{location}&sensor=false").read

# Parse the response string into a Ruby data structure
# (You will need to figure out what kind of structure it is) hash
data = JSON.parse(json_data)

# 1. TO DO:
# Replace the following 0's with expressions
# that will extract the latitude and longitude
#puts data.keys.join(',')
#puts data.values
#puts data[0]["results"]["geometry"]["location"]["lat"]
#puts data
#array = data.to_a
#array.index[1]

puts JSON.pretty_generate(data)
#puts data['results']['geometry']['location']['lat']
#puts data['results']['formatted_address'] ->shows no implicit conversion of String into Integer (TypeError)
#puts data.class --> its hash
#puts data['results'].class ->its an array
#puts data['results'][0] -> its hash

result0 = data['results'][0]
puts result0.keys
puts result0['geometry']
#puts result0['geometry'].class -->its a hash
puts result0['geometry'].keys
#puts result0['geometry']['location'] -->it's a hash
puts result0['geometry']['location']

latitude = result0['geometry']['location']['lat']
longitude = result0['geometry']['location']['lng']

# Output latitude and longitude to the screen
puts "Latitude: #{latitude}"
puts "Longitude: #{longitude}"


