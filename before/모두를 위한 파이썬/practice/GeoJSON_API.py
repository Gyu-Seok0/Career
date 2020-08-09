import urllib.request, urllib.parse, urllib.error
import json

serviceurl = 'https://maps.googleapis.com/maps/api/geocode/json?'

while True:
    address = input('Enter location: ')
    if len(address) < 1: break

    url = serviceurl + urllib.parse.urlencode({'address': address})+'&key='

    print('Retrieving', url)
    uh = urllib.request.urlopen(url)
    data = uh.read().decode()  #외부로 온 UTF-8이기 떄문에 이를 유니코드로 변환
    print('Retrieved', len(data), 'characters')

    try:
        js = json.loads(data)
    except:
        js = None

    if not js or 'status' not in js or js['status'] != 'OK':
        print('==== Failure To Retrieve ====')
        print(data)
        continue
    print(json.dumps(js, indent=4))

    lat = js["results"][0]["geometry"]["location"]["lat"]
    lng = js["results"][0]["geometry"]["location"]["lng"]
    print('lat', lat, 'lng', lng)
    location = js['results'][0]['formatted_address']
    print(location)

# Enter location: Korea, Seoul
# Retrieving http://maps.googleapis.com/maps/api/geocode/json?address=Korea%2C+Seoul
# Retrieved 1517 characters
# lat 37.566535 lng 126.9779692
# Seoul, South Korea
