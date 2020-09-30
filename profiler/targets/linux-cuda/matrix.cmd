#!/bin/sh

#  Copyright (c) 2018-2020, Carnegie Mellon University
#  See LICENSE for details

TEMPDIR=$PWD

##  Taking a simple approach here: copy CMakeLists.txt from common folder to
##  the temp directory; run cmake to configure then build the target and
##  finally, if successful, execute the target.

cp -f ../../targets/common/CMakeLists-matrix.txt $TEMPDIR/CMakeLists.txt
mv testcode.c testcode.cu
cmake . > /dev/null
make install > /dev/null

if [ -f ./matrix ]; then
    ./matrix > matrix.txt
else
    touch matrix.txt
fi
