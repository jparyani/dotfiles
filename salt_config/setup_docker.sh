#!/bin/sh

apt-get install wget git

mkdir -p /srv
cd /srv

git clone https://github.com/jparyani/dotfiles.git
cd dotfiles/salt_config

wget -O - http://bootstrap.saltstack.org | sudo sh
salt-call -c /srv/dotfiles/salt_config --local state.highstate
