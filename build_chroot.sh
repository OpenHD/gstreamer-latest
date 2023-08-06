#!/bin/bash
#This file is the install instruction for the CHROOT build
#We're using cloudsmith-cli to upload the file in CHROOT

sudo apt install -y python3-pip
sudo pip3 install --upgrade cloudsmith-cli
ls -a
meson --prefix=/tmp/gst-plugins-good/usr -Dgood=enabled -Dgst-plugins-good:qt5=enabled build 
ninja -c build

mkdir -p /opt/out/
cp -v *.dep /opt/out/
echo "copied deb file"
echo "push to cloudsmith"
git describe --exact-match HEAD >/dev/null 2>&1
echo "Pushing the package to OpenHD 2.3 repository"
ls -a
API_KEY=$(cat cloudsmith_api_key.txt)
DISTRO=$(cat distro.txt)
FLAVOR=$(cat flavor.txt)
cloudsmith push deb --api-key "$API_KEY" openhd/openhd-2-3-evo/${DISTRO}/${FLAVOR} *.deb || exit 1

