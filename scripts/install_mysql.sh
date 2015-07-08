#! /usr/bin/env bash

echo "mysql-server mysql-server/root_password password ''" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password ''" | debconf-set-selections

apt-get install -y mysql-server mysql-client libmysqlclient-dev
