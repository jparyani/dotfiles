#!/bin/sh
apt-get update
apt-get install -y -qq wget git sudo python-software-properties procps software-properties-common

mkdir -p /srv
cd /srv

git clone https://github.com/jparyani/dotfiles.git
cd dotfiles/salt_config

wget -O - https://raw.github.com/saltstack/salt-bootstrap/stable/bootstrap-salt.sh | sh
salt-call -c /srv/dotfiles/salt_config --local state.highstate
