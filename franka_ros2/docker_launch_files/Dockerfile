FROM ros:foxy

### Make installation non interactive so that docker doesnt crash during build
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y &&\
    apt-get install -y --allow-unauthenticated \
    python3-pip \
    git \
    build-essential \
    clang-6.0 \
    clang-format-6.0 \
    clang-tidy-6.0 \
    cmake \
    libpoco-dev \
    libeigen3-dev \
    doxygen \
    graphviz \
    lcov \
    rename \
    valgrind \
    lsb-release \
    dpkg \
    ros-foxy-control-msgs \
    ros-foxy-xacro \
    ros-foxy-ament-cmake-clang-format \
    ros-foxy-ament-clang-format \
    ros-foxy-ament-flake8 \
    ros-foxy-ament-cmake-clang-tidy \
    ros-foxy-angles \
    ros-foxy-ros2-control \
    ros-foxy-realtime-tools \
    ros-foxy-control-toolbox \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install -U \
    argcomplete \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-deprecated \
    flake8-docstrings \
    flake8-import-order \
    flake8-quotes \
    pytest-repeat \
    pytest-rerunfailures \
    pytest
    
RUN apt-get update &&\
    apt-get install -y \
    python3-tk \
    python3-gi-cairo
    
WORKDIR /docker_volume

### Install Libfranka
COPY ./install_libfranka.sh /install_libfranka.sh
RUN chmod +x /install_libfranka.sh
ENTRYPOINT [ "/install_libfranka.sh" ]

CMD ["/bin/bash"]

### Important: for every reboot: run xhost +local:docker
