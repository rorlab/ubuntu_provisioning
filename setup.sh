#!/bin/bash

echo "Provision virtual machine..."

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

echo "Installing sqlite3"
  sudo apt-get install libsqlite3-dev -y > /dev/null 2>&1

echo "Installing MySQL"
  sudo apt-get install debconf-utils -y > /dev/null 2>&1
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 12345678'
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 12345678'
  sudo apt-get install mysql-server mysql-client libmysqlclient-dev -y > /dev/null 2>&1

echo "Installing Redis"
  sudo apt-get install redis -y > /dev/null 2>&1

echo "Installing Pygments"
  sudo apt-get install python-pygments > /dev/null 2>&1

echo "Installing Miscellaneous Libraries"
  sudo apt-get install -y libssl-dev libreadline-dev > /dev/null 2>&1

echo "Installing rbenv"
  if [ ! -d "$HOME/.rbenv" ]; then
    sudo -H -u vagrant bash -i -c 'mkdir $HOME/.rbenv' > /dev/null 2>&1
    git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv > /dev/null 2>&1
  fi
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"'               >> ~/.bashrc
  source ~/.bashrc

echo "Installing ruby-build"
  if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
    sudo -H -u vagrant bash -i -c 'mkdir -p $HOME/.rbenv/plugins/ruby-build' > /dev/null 2>&1
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build > /dev/null 2>&1
  fi

echo "Installing ruby 2.3.0"
  sudo -H -u vagrant bash -i -c 'rbenv install 2.3.0' > /dev/null 2>&1
  sudo -H -u vagrant bash -i -c 'rbenv rehash' > /dev/null 2>&1
  sudo -H -u vagrant bash -i -c 'rbenv global 2.3.0' > /dev/null 2>&1
  sudo -H -u vagrant bash -i -c 'gem install bundler --no-ri --no-rdoc' > /dev/null 2>&1
  sudo -H -u vagrant bash -i -c 'rbenv rehash' > /dev/null 2>&1

echo "Provision completed!"
