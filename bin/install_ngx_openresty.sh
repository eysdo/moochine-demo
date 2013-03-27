#!/bin/bash

mkdir -p ~/openresty_downloads
cd ~/openresty_downloads

echo ""
echo "------------------------------------------------------------------------"
echo "INSTALL Required Library..."
echo "------------------------------------------------------------------------"

apt-get install build-essential libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl libyaml-dev libmagickcore-dev libmagickwand-dev git

echo ""
echo "------------------------------------------------------------------------"
echo "INSTALL libdrizzle..."
echo "------------------------------------------------------------------------"

rm -rf drizzle7-2011.07.21.tar.gz drizzle7-2011.07.21
wget http://agentzh.org/misc/nginx/drizzle7-2011.07.21.tar.gz
tar xzvf drizzle7-2011.07.21.tar.gz
cd drizzle7-2011.07.21/
./configure --without-server
make libdrizzle-1.0
make install-libdrizzle-1.0
cd ..

echo ""
echo "------------------------------------------------------------------------"
echo "INSTALL PostgreSQL..."
echo "------------------------------------------------------------------------"

rm -rf postgresql-9.2.3.tar.gz postgresql-9.2.3
wget http://ftp.postgresql.org/pub/source/v9.2.3/postgresql-9.2.3.tar.gz
tar vfxz postgresql-9.2.3.tar.gz
cd postgresql-9.2.3
./configure
make
make install
cd ..

echo ""
echo "------------------------------------------------------------------------"
echo "INSTALL OpenResty..."
echo "------------------------------------------------------------------------"

rm -rf ngx_openresty-1.2.7.3.tar.gz ngx_openresty-1.2.7.3
wget http://agentzh.org/misc/nginx/ngx_openresty-1.2.7.3.tar.gz
tar xzvf ngx_openresty-1.2.7.3.tar.gz
cd ngx_openresty-1.2.7.3
./configure --with-http_stub_status_module --with-http_realip_module --with-pcre-jit --with-luajit --with-http_postgres_module --with-http_drizzle_module --with-libpq=/usr/local/pgsql -j6
make -j6
make install
cd ..

echo ""
echo "------------------------------------------------------------------------"
echo "DONE!"
echo "------------------------------------------------------------------------"
