require 'httparty'

def fetch_crypto_prices
  url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd"
  response = HTTParty.get(url)
  
  if response.success?
    cryptos = response.parsed_response.sort_by { |crypto| -crypto['market_cap'] }
    top_5_cryptos = cryptos.first(5)
    
    puts "Top 5 Cryptocurrencies by Market Capitalization:"
    top_5_cryptos.each do |crypto|
      puts "#{crypto['name']} - Price: $#{crypto['current_price']} - Market Cap: $#{crypto['market_cap']}"
    end
  else
    puts "Failed to fetch cryptocurrency data."
  end
end

fetch_crypto_prices
