#!/bin/bash

### LIBFRANKA
cd /docker_volume/libfranka

if [ ! -d "build" ]
then 
    mkdir build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF  ..
    cmake --build . -j$(nproc)
    cpack -G DEB
    sudo dpkg -i libfranka-*.deb
fi


### FRANKA ROS2
source /opt/ros/humble/setup.sh
cd /docker_volume/ros2_ws
if [ ! -d "install" ]
then 
    colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DFranka_DIR:PATH=/docker_volume/libfranka/build
fi
source install/setup.sh


cd /docker_volume

echo "Attaching to container"
exec "$@"