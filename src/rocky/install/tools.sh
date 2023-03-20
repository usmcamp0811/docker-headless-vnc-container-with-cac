#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
dnf -y install epel-release
dnf -y update
dnf -y install vim sudo wget which net-tools bzip2 findutils procps \
    numpy \
    dbus-glib \
    psmisc \
    pcsc-lite-ccid \
    opensc \
    pcsc-lite \
    nss-tools \
    gnutls-utils \
    usbutils \
    pciutils \
    lsscsi \
    util-linux-ng \
    supervisor

dnf -y install mailcap
dnf clean all

# modutil -dbdir sql:$HOME/.pki/nssdb/ -add "CAC Module" -libfile /usr/lib64/pkcs11/p11-kit-client.so
