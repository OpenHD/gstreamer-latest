#!/usr/bin/env bash

# Install all the dependencies needed to build QOpenHD from source.

apt -y install libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-good ruby
apt -y install git

pip3 install meson

gem install fpm
