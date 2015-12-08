#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

#rm -rf $TMPDIR/godep
echo "building"
/usr/local/go/bin/go build -o app *.go
echo "running in `pwd`"
./app &
