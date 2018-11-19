#!/bin/bash

set -e

export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
export LANG=C

tar -C /tmp -xjf /build/ericscript-0.5.5.tar.bz2
perl /tmp/ericscript-0.5.5/ericscript.pl "$@"