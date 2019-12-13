#!/bin/bash

set -x
set -e

VERSION=$(head -5 ChangeLog.rst | tail -1)
IMPLEMENTATIONS="ccl-bin sbcl-bin sbcl"

for IMPL in $IMPLEMENTATIONS
do
    docker build \
           --target lisp-image-with-$IMPL \
           -t 40ants/base-lisp-image:${VERSION}-$IMPL \
           -t 40ants/base-lisp-image:latest-$IMPL \
           -f Dockerfile .
    
    docker push 40ants/base-lisp-image:${VERSION}-$IMPL
    docker push 40ants/base-lisp-image:latest-$IMPL
done
