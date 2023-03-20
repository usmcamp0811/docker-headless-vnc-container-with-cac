#!/bin/sh

curl ${DOD_CERT_URL} --output $HOME/dodcerts.zip

unzip dodcerts.zip -d dodcerts
cd $(ld dodcerts)

mkdir -p $HOME/.pki/nssdb

modutil -dbdir sql:$HOME/.pki/nssdb/ -add "CAC Module" -libfile /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so -force

 for n in $(ls * | grep Certificates); do certutil -d sql:$HOME/.pki/nssdb -A -t TC -n $n -i $n; done

 chown -R ${VNC_USER:-vnc_user} $HOME


