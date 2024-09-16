#!/usr/bin/env bash

VER=3.12.6


apt update
apt install tk-dev libncurses-dev libgdbm-dev libreadline-dev libbz2-dev libdb-dev libffi-dev liblzma-dev libsqlite3-dev libssl-dev zlib1g-dev openssl

cd /tmp
wget https://www.python.org/ftp/python/$VER/Python-$VER.tar.xz

tar -xJf Python-3.12.6.tar.xz
cd Python-3.12.6

./configure --with-ensurepip=install --prefix=/usr/local

make
# checkinstall
make install

cd ~
rm -rf /tmp/*
