FROM osrf/ros:noetic-desktop-focal

### Make installation non interactive so that docker doesnt crash during build
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y &&\
    apt-get install -y \
    git \
    build-essential \
    cmake \
    clang-7 \
    clang-format-7 \
    clang-tidy-7 \
    libeigen3-dev \
    libpoco-dev \
    pycodestyle \
    liborocos-kdl-dev \
    python3-pip \
    python3-catkin-tools \
    ros-noetic-libfranka \
    ros-noetic-boost-sml \
    ros-noetic-ros-control \
    ros-noetic-eigen-conversions \
    ros-noetic-gazebo-dev \
    ros-noetic-gazebo-ros-control \
    ros-noetic-urdfdom-py \
    && rm -rf /var/lib/apt/lists/*
    
### Python setup
RUN apt-get update &&\
    apt-get install python3.10 -y &&\
    apt install -y python3-tk &&\
    apt install -y python3-gi-cairo &&\
    pip install --upgrade pip &&\
    pip install numpy==1.23.1 &&\
    pip install matplotlib==3.5.2 &&\
    pip install parameterized
    
WORKDIR /docker_volume

### Install Libfranka
COPY ./install_libfranka.sh /install_libfranka.sh
RUN chmod +x /install_libfranka.sh
ENTRYPOINT [ "/install_libfranka.sh" ]

CMD ["/bin/bash"]

### Important: for every reboot: run xhost +local:docker
