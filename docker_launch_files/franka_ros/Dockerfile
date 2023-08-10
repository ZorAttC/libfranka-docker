FROM ros:noetic

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

### ROS setup
RUN apt-get update -y &&\
    apt-get install -y \
        ros-noetic-rviz

### Install display mounting tools
RUN apt-get update -y &&\
    apt-get install -y  \
        python3-tk \
        python3-gi-cairo


### Set Working Directory    
WORKDIR /docker_volume


### Install Libfranka
COPY ./install_franka_ros.sh /install_franka_ros.sh
RUN chmod +x /install_franka_ros.sh
ENTRYPOINT [ "/install_franka_ros.sh" ]

CMD ["/bin/bash"]

### Important: for every reboot: run xhost +local:docker
