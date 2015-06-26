# Require Ruby libraries
require 'open-uri'
require 'json'

origin = "5555 South Ellis Avenue, Chicago, Illinois, 60637"
destination = "United Center, Chicago, Illinois"

# Convert to an HTTP-compatible querystring parameters
origin = URI.escape(origin)
destination = URI.escape(destination)

# Send an HTTP request to the Google Directions API
url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&sensor=false"
puts url
json_data = open(url).read

# Parse the response string into a Ruby data structure
# (You will need to figure out what kind of structure it is)
data = JSON.parse(json_data)

puts data.keys
puts JSON.pretty_generate(data)
#puts data['routes'].class -->its an array
#puts data['routes'][0]--> its a hash
#puts data['routes'][0]['legs']-->its an array
#puts data['routes'][0]['legs'][0] -->hash
#puts data['routes'][0]['legs'][0]['distance'] -->hash
puts data['routes'][0]['legs'][0]['distance'].keys#hash
puts data['routes'][0]['legs'][0]['duration']     #hash
#puts data['routes'][0]['legs'][0]['steps']        #array

a = data['routes'][0]['legs'][0]['steps']
a.each do |a|
	puts a
	puts
end

#puts a[0]['distance']['text'] #String
#puts a[1]['distance']['text']

a.each do |a|
	puts a['distance']['text']
	puts
end

# 1. TO DO:
# Replace the following 0 with an expression that will retrieve the total travel time
total_time = 0

a.each do |a|
	puts a['duration']['text'].delete" j-m"
	puts 
end

puts a[0]['duration']['text'].split.to_i

# Output the total drive time to the screen
#puts "Total travel time driving: #{total_time}"

# 2. TO DO:
# Replace the following 0 with an expression that will retrieve the total distance
total_distance = 0

# Output the total distance to the screen
#puts "Total distance traveled: #{total_distance}"
