#!/usr/bin/env python

# *** Simple Weather ***
#
# A simple Python script to fetch up-to-date weather
# information.
# 
# Homepage: http://jaux.net/my-works/project-simpleweather/
# Author:   Jaux (http://jaux.net)
# Version:  1.0
#
# --------------------------------------------------------- #
#
# REQUIREMENT
#
# Python >= 2.5
#
#
# --------------------------------------------------------- #
#
# CONFIGURATION
# 
# location: US Zip code or Location ID.
# units:    c = Celsius, f = Fahrenheit.
# utf-8:    True or False. If True, temperature output
#           will contain the degree symbol.
#
# How to get Location ID: (http://developer.yahoo.com/weather/)
#
#     To find your location ID, browse or search for your city
#     from the  home page. The weather ID is in the URL for
#     the forecast page for that city. You can also get the
#     location ID by entering your zip code on the home page.
#     For example, if you search for Los Angeles on the home
#     page, the forecast page for that city is
#     http://weather.yahoo.com/forecast/USCA0638.html. The
#     location ID is USCA0638.
#
# --------------------------------------------------------- #

param = {
    'location': 'RSXX0267',    # zip code or Location ID
    'units'   : 'c',           # C/F
    'utf-8'   : False          # use utf-8? True/False
} 

# --------------------------------------------------------- #

yahoo_weather_api = 'http://weather.yahooapis.com/forecastrss?'
yahoo_weather_ns =  'http://xml.weather.yahoo.com/ns/rss/1.0'
cond_path = 'channel/item/{%s}condition' % yahoo_weather_ns
if param['utf-8']:
    output_tempalte = u'%(cond_text)s %(temp)s\u00b0%(units)s'
else:
    output_tempalte = '%(cond_text)s %(temp)s%(units)s'

# --------------------------------------------------------- #

import urllib, urllib2
from xml.etree.ElementTree import parse

param_map = {'p': param['location'],
             'u': param['units'] }

url = yahoo_weather_api + urllib.urlencode(param_map);
try:
    rss = urllib2.urlopen(url)
    cond_elem = parse(rss).find(cond_path)
except urllib2.URLError:
    print('Network Error')
    sys.exit(1)
except:
    print('Fetch Data Error')
    sys.exit(1)

output = output_tempalte % {'cond_text': cond_elem.attrib['text'],
                            'temp': cond_elem.attrib['temp'],
                            'units': param['units'].upper()}
if param['utf-8']:
    print(output.encode('utf-8'))
else:
    print(output)
