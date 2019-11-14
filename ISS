#  Code created by Jarvis during insecurity strike in JKUAT

import json
import urllib.request

p1 = []
url = 'http://api.open-notify.org/astros.json'
req = urllib.request.urlopen(url)
info = json.loads(req.read())
num = info['number']

url2 = 'http://api.open-notify.org/iss-now.json'
req2 = urllib.request.urlopen(url2)
locat = json.loads(req2.read())
lat = locat['iss_position']['latitude']
lng = locat['iss_position']['longitude']

url3 = 'http://api.geonames.org/extendedFindNearbyJSON?lat={}&lng={}&username=vector'.format(lat, lng)
req3 = urllib.request.urlopen(url3)
place = json.loads(req3.read())

try:
    for i in place['geonames']:
        p1.append(i['name'])
except KeyError:
    p1.append(place['ocean']['name'])
lst = (', '.join(p1[:1:-1]))

print('There are currently {} crew members living on the International Space Station.\nThey are:'.format(num))
for i in info['people']:
    if i['craft'] == 'ISS':
        print(i['name'])

if len(p1) == 1:
    print('\nThe current location of the ISS is the {}'.format(p1[0]))
else:
    print('\nThe current location of the ISS is {}'.format(lst))

print('\nThe current latitude is {} and longitude is {}'.format(lat, lng))
