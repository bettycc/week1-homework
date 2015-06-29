# Require Ruby libraries
require 'open-uri'
require 'json'

# Our classroom location
location = "5555 South Ellis Avenue, Chicago, Illinois, 60637"

# Convert to an HTTP-compatible querystring parameter
location = URI.escape(location)

# Send an HTTP request to the OpenWeatherMap API
json_data = open("http://api.openweathermap.org/data/2.5/weather?q=#{location}&units=imperial").read

# Parse the response string into a Ruby data structure
# (You will need to figure out what kind of structure it is)
data = JSON.parse(json_data)


# 1. TO DO:
# Replace the following 0 with an expression
# that will extract the temperature
#puts data.keys
#puts data.values
#puts data['main']['temp']

temp = data['main']['temp']

# Output the temperature to the screen
puts "It is currently #{temp.round(0)}\u00B0 outside."
