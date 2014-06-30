#!/bin/bash
/usr/local/bin/brew update
( /usr/local/bin/brew outdated ; /usr/local/bin/brew cask doutdated ) | /usr/local/bin/python /Users/jason/email_me.py - 'mars: brew outdated' 'mars-outdated@jparyani.com'
