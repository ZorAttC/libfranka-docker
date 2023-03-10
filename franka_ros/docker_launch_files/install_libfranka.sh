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


### FRANKA ROS
cd /docker_volume
if [ ! -d "catkin_ws" ]
then 
    mkdir -p catkin_ws/src
    cd catkin_ws
    source /opt/ros/noetic/setup.sh
    catkin_init_workspace src
    git clone --recursive https://github.com/frankaemika/franka_ros src/franka_ros
    rosdep install --from-paths src --ignore-src --rosdistro noetic -y --skip-keys libfranka
    catkin_make -DCMAKE_BUILD_TYPE=Release -DFranka_DIR:PATH=/docker_volume/libfranka/build
    source devel/setup.sh
fi

source /opt/ros/noetic/setup.sh
source devel/setup.sh

echo "Attaching to container"
exec "$@"

