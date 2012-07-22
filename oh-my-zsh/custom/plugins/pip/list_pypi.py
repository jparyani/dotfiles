#!/usr/bin/python

from bs4 import BeautifulSoup
import urllib2

p=urllib2.urlopen('http://pypi.python.org/pypi/').read()

b=BeautifulSoup(p)

for t in b.findAll('tr'):
    try: print t.td.text.replace(u'\xa0', ' ').encode()
    except: pass




