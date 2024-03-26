require 'httparty'

def fetch_timezone_time(area_location)
  url = "http://worldtimeapi.org/api/timezone/#{area_location}"
  response = HTTParty.get(url)
  
  if response.success?
    time_data = response.parsed_response
    puts "The current time in #{area_location} is #{time_data['datetime']}"
  else
    puts "Failed to fetch time data for timezone: #{area_location}."
  end
end

fetch_timezone_time('Europe/London')
fetch_timezone_time('Asia/Tokyo')
fetch_timezone_time('America/Memphis') # Doesnt show, will fail
fetch_timezone_time('America/Denver')
