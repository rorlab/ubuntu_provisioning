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

# echo "Updating Packages"
echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Updating Packages...\e[0m"
  sudo apt-get update > /dev/null 2>&1

echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Korean Language Pack\e[0m"
  sudo apt-get install language-pack-ko -y > /dev/null 2>&1

echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Git\e[0m"
  sudo apt-get install curl git-core python-software-properties -y > /dev/null 2>&1

echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Nginx\e[0m"
  sudo apt-get install nginx -y > /dev/null 2>&1

echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Nodejs\e[0m"
  sudo apt-get install nodejs -y > /dev/null 2>&1

echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Imagemagick\e[0m"
  sudo apt-get install imagemagick -y > /dev/null 2>&1

if promptyn "Do you wish to install sqlite3? (y/n)"; then
    echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing sqlite3\e[0m"
    sudo apt-get install libsqlite3-dev -y > /dev/null 2>&1
fi

echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing MySQL\e[0m"
  sudo apt-get install debconf-utils -y > /dev/null 2>&1
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 12345678'
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 12345678'
  sudo apt-get install mysql-server mysql-client libmysqlclient-dev -y > /dev/null 2>&1

if promptyn "Do you wish to install Redis? (y/n)"; then
    echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Redis\e[0m"
    sudo apt-get install redis -y > /dev/null 2>&1
fi

if promptyn "Do you wish to install Pygments? (y/n)"; then
    echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Pygments\e[0m"
    sudo apt-get install python-pygments > /dev/null 2>&1
fi

echo -e "\e[30;48;5;82m[Info]\e[40;38;5;82m Installing Miscellaneous Libraries\e[0m"
  sudo apt-get install -y libssl-dev libreadline-dev > /dev/null 2>&1
