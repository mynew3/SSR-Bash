#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
######Check Root######
[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }
######Check Root#####
clear

#InstallBasicPackages
  apt-get update -y
  apt-get install language-pack-zh-hans build-essential git vim tar python-pip unzip bc -y
  pip install shadowsocks

#Clone Something
cd /usr/local
git clone https://github.com/breakwa11/shadowsocks
git clone https://github.com/FunctionClub/ss-bash

#Intall libsodium
wget --no-check-certificate -O libsodium-1.0.10.tar.gz https://github.com/jedisct1/libsodium/releases/download/1.0.10/libsodium-1.0.10.tar.gz
tar -xf libsodium-1.0.10.tar.gz && cd libsodium-1.0.10
./configure && make && make install
echo "/usr/local/lib" > /etc/ld.so.conf.d/local.conf && ldconfig
cd ../ && rm -rf libsodium* 
 #Install Softlink
 ln -s /usr/local/ss-bash/ssadmin.sh /usr/local/bin/ssadmin
