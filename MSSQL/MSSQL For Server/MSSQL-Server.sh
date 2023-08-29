#!/bin/usr/bash
echo '#########################===> start  Add Libs of mssql'

curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"

echo '#########################===> end Add Libs of mssql'

echo '#########################===> start of installing mssql'

sudo apt-get update
sudo apt-get install -y mssql-server

echo '#########################===> end of mssql installation'
echo '#########################===> start Adding missed Libs of mssql'

wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb

sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.19_amd64.deb

sudo wget http://http.us.debian.org/debian/pool/main/o/openldap/libldap-2.4-2_2.4.47+dfsg-3+deb10u7_amd64.deb

sudo apt install ./libldap-2.4-2_2.4.47+dfsg-3+deb10u7_amd64.deb
echo '#########################===> end of adding missed libs '

echo '#########################===> start setup'
sudo /opt/mssql/bin/mssql-conf setup

echo 'checking status'
systemctl status mssql-server --no-pager
echo '#######################===> Enable Default port from firewall'
sudo ufw allow 1433/tcp
echo 'All Done now enjoy => yours : Yousef Rashed'