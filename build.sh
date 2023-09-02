#!/bin/sh
CWD=`pwd`
TEMPDIR=`mktemp -d`
cd $TEMPDIR
git clone https://github.com/justhx0r/casper_encrypted_persistence.git && \
cd casper_encrypted_persistence && \
rm * 2> /dev/null > /dev/null || true && \
dpkg -b . .. && mv ../casper_*.dev $CWD
