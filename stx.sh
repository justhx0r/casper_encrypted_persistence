#!/bin/sh
/usr/local/bin/staticx "$@"
/usr/bin/chown user:user . --recursive
