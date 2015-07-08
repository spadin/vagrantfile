#! /usr/bin/env bash

wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

apt-get update

apt-get install -y xvfb unzip
apt-get install -y google-chrome-stable

LATEST_CHROMEDRIVER_RELEASE=`wget -qO- http://chromedriver.storage.googleapis.com/LATEST_RELEASE`

wget -q -N http://chromedriver.storage.googleapis.com/${LATEST_CHROMEDRIVER_RELEASE}/chromedriver_linux64.zip -P /tmp
unzip /tmp/chromedriver_linux64.zip -d /tmp
rm /tmp/chromedriver_linux64.zip
chmod +x /tmp/chromedriver
mv /tmp/chromedriver /usr/local/share/chromedriver
ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
