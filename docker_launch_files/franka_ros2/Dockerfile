FROM ros:humble

### Make installation non interactive so that docker doesnt crash during build
ENV DEBIAN_FRONTEND noninteractive

### Basic OS setup
RUN apt-get update -y &&\
    apt-get install -y \
        git \
        cmake \
        python3-pip \
        build-essential \
        libeigen3-dev \
        libpoco-dev

### ROS 2 Setup
RUN apt-get update -y &&\
    apt-get install -y --allow-unauthenticated \
        ros-humble-control-msgs \
        ros-humble-xacro \
        ros-humble-ament-cmake-clang-format \
        ros-humble-ament-clang-format \
        ros-humble-ament-flake8 \
        ros-humble-ament-cmake-clang-tidy \
        ros-humble-angles \
        ros-humble-ros2-control \
        ros-humble-realtime-tools \
        ros-humble-control-toolbox \    
        ros-humble-controller-manager \
        ros-humble-hardware-interface \
        ros-humble-generate-parameter-library \
        ros-humble-controller-interface \
        ros-humble-ros2-control-test-assets \
        ros-humble-controller-manager &&\
    rm -rf /var/lib/apt/lists/*

### Pip installs
# RUN python3 -m pip install -U \
#         argcomplete \
#         flake8-blind-except \
#         flake8-builtins \
#         flake8-class-newline \
#         flake8-comprehensions \
#         flake8-deprecated \
#         flake8-docstrings \
#         flake8-import-order \
#         flake8-quotes \
#         pytest-repeat \
#         pytest-rerunfailures \
#         pytest

### Install display mounting tools
RUN apt-get update -y &&\
    apt-get install -y  \
        python3-tk \
        python3-gi-cairo
    
WORKDIR /docker_volume

### Install Libfranka
COPY ./install_franka_ros2.sh /install_franka_ros2.sh
RUN chmod +x /install_franka_ros2.sh
ENTRYPOINT [ "/install_franka_ros2.sh" ]

CMD ["/bin/bash"]

### Important: for every reboot: run xhost +local:docker
