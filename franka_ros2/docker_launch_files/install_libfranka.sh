#!/bin/bash

### LIBFRANKA
cd /docker_volume
if [ ! -d "libfranka" ]
then 
    git clone --recursive https://github.com/frankaemika/libfranka --branch 0.10.0 
fi
cd libfranka

if [ ! -d "build" ]
then 
    mkdir build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF  ..
    cmake --build . -j$(nproc)
    cpack -G DEB
    sudo dpkg -i libfranka-*.deb
fi

### FRANKA ROS2
cd /docker_volume
if [ ! -d "franka_ros2_ws" ]
then 
    mkdir -p franka_ros2_ws/src
    source /opt/ros/foxy/setup.bash
    cd franka_ros2_ws
    git clone https://github.com/frankaemika/franka_ros2.git src/franka_ros2
    colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release -DFranka_DIR:PATH=/docker_volume/libfranka/build
    source install/setup.sh
fi

echo "Attaching to container"
exec "$@"