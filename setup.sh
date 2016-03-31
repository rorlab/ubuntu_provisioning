#!/bin/bash

promptyn () {
    while true; do
        read -p "$1 " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

echo "Updating Packages"
  sudo apt-get update > /dev/null 2>&1

echo "Installing Korean Language Pack"
  sudo apt-get install language-pack-ko -y > /dev/null 2>&1

echo "Installing Git"
  sudo apt-get install curl git-core python-software-properties -y > /dev/null 2>&1

echo "Installing Nginx"
  sudo apt-get install nginx -y > /dev/null 2>&1

echo "Installing Nodejs"
  sudo apt-get install nodejs -y > /dev/null 2>&1

echo "Installing Imagemagick"
  sudo apt-get install imagemagick -y > /dev/null 2>&1

if promptyn "Do you wish to install sqlite3? (y/n)"; then
    echo "Installing sqlite3"
    sudo apt-get install libsqlite3-dev -y > /dev/null 2>&1
fi

echo "Installing MySQL"
  sudo apt-get install debconf-utils -y > /dev/null 2>&1
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 12345678'
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 12345678'
  sudo apt-get install mysql-server mysql-client libmysqlclient-dev -y > /dev/null 2>&1

if promptyn "Do you wish to install Redis? (y/n)"; then
    echo "Installing Redis"
    sudo apt-get install redis -y > /dev/null 2>&1
fi

if promptyn "Do you wish to install Pygments? (y/n)"; then
    echo "Installing Pygments"
    sudo apt-get install python-pygments > /dev/null 2>&1
fi

echo "Installing Miscellaneous Libraries"
  sudo apt-get install -y libssl-dev libreadline-dev > /dev/null 2>&1
