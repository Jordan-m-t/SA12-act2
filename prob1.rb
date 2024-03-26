require 'httparty'

def fetch_most_starred_repo(username)
  url = "https://api.github.com/users/#{username}/repos"
  response = HTTParty.get(url)
  
  if response.success?
    most_starred_repo = response.parsed_response.max_by { |repo| repo['stargazers_count'] }
    
    if most_starred_repo
      puts "Most Starred Repository:"
      puts "Name: #{most_starred_repo['name']}"
      puts "Description: #{most_starred_repo['description']}"
      puts "Stars: #{most_starred_repo['stargazers_count']}"
      puts "URL: #{most_starred_repo['html_url']}"
    else
      puts "No repositories found for user: #{username}"
    end
  else
    puts "Failed to fetch repositories for user: #{username}"
  end
end

fetch_most_starred_repo('Jordan-m-t')
