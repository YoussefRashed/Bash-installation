#!/usr/bin/bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt-get update

echo 'Update is done successfully !!'

sudo apt-get -y install postgresql

echo 'PostreSql installed successfully !!'
echo 'Allow Default PostgreSql ports'
sudo ufw allow 5432
sudo ufw allow 5432/tcp