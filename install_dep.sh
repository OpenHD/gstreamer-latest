#!/usr/bin/env bash

# Install all the dependencies needed to build QOpenHD from source.

apt -y install libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-good python3 ruby
apt -y install git flex bison 

pip install meson
#dirty fix for meson not being found when not in /usr/bin
cp /usr/local/bin/meson /usr/bin/meson


gem install fpm
