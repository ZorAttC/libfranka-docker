#!/bin/bash

# clone the repo if not existent
if [ ! -d "libfranka" ]
then 
    git clone --recursive https://github.com/frankaemika/libfranka --branch 0.10.0 
fi

cd libfranka

# build the repo
if [ ! -d "build" ]
then 
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF ..
    cmake --build .
    cpack -G DEB
fi

echo "Attaching to container"
exec "$@"