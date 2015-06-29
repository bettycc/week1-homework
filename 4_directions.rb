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

##From line 21 to line 37, to make sure the type of each sublists
##
##
puts data.keys
puts JSON.pretty_generate(data) #Organize the list so that its easier for us to read
#puts data['routes'].class -->its an array
#puts data['routes'][0]--> its a hash
#puts data['routes'][0]['legs']-->its an array
#puts data['routes'][0]['legs'][0] -->hash
#puts data['routes'][0]['legs'][0]['distance'] -->hash
puts data['routes'][0]['legs'][0]['distance'].keys#hash
puts data['routes'][0]['legs'][0]['duration']     #hash
#puts data['routes'][0]['legs'][0]['steps']        #array

#puts a[0]['distance']['text'] #String
#puts a[1]['distance']['text']

a = data['routes'][0]['legs'][0]['steps']
#a.each do |a|
#	puts a
#	puts
#end



#From line 50 to 61, use iterator to calculate the total distance
#
#

travel_distance = 0
a.each do |a|
	#puts a['distance']['text']
	if a['distance']['text'][4] == "m"
		travel_distance = travel_distance + a['distance']['text'][0,4].to_f*5280 
		#puts travel_distance
	else
		travel_distance = travel_distance + a['distance']['text'][0,4].to_i
		#puts travel_distance
	end
	puts
end


# 1. TO DO:
# Replace the following 0 with an expression that will retrieve the total travel time
#puts a[0]['duration']['text'].class String
#puts a[0]['duration']['text'][0,1].to_i.class Fixnum
#From line 69 to 80, use iterator to calculate the total travel time

total_time = 0

b = 0
a.each do |a|
	#puts a['duration']['text'][0,1].to_i
	b = b + a['duration']['text'][0,1].to_i
	#puts b
end
total_time = b
#puts "#{total_time}"




# Output the total drive time to the screen
puts "Total travel time driving: #{total_time} mins"

# 2. TO DO:
# Replace the following 0 with an expression that will retrieve the total distance
total_distance = 0
total_distance = travel_distance
# Output the total distance to the screen
puts "Total distance traveled: #{total_distance} ft"
