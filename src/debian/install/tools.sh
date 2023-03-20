#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update
apt-get install -y vim wget net-tools locales bzip2 procps \
    opensc-pkcs11 libpam-pkcs11 pcscd \
    libnss3-tools \
    python3-numpy #used for websockify/novnc
  
apt-get clean -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
