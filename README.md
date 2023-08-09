# libfranka-docker

Docker Images for portable [libfranka](https://frankaemika.github.io/docs/libfranka.html) execution for both [franka_ros](https://frankaemika.github.io/docs/franka_ros.html) and [franka_ros2](https://frankaemika.github.io/docs/franka_ros2.html).

## Requirements

The use of this repo requires [Docker](https://docs.docker.com/engine/install/) and the [Docker Compose Plugin](https://docs.docker.com/compose/install/linux/) of minimum version 2. It is recommended to use Ubuntu as underlying operating system. However, for the use on Windows, a dedicated branch windows exists.

## Installation

Get the repository with 

	git clone --recursive https://github.com/Fjakob/libfranka-docker.git

The libraries `libfranka`, `franka_ros` and `franka_ros2` will be pulled as submodules upon cloning.

## Usage

In the terminal, cd to docker_launch_files. Dependent on whether you want to use franka_ros or franka_ros2, run either of the following

	docker-compose run franka_ros
	docker-compose run franka_ros2

or run

	docker-compose up

to start both containers.

To enable display mounting (e.g. for RVIZ or Gazebo), run

	xhost +local:docker
	
on the host machine. For Windows machines instead, install [VcXsrv](https://sourceforge.net/projects/vcxsrv/) on your machine and start it.

## Remarks

* The workspace in the container mirrors the [docker_volume](/docker_volume/) directory in a docker volume, such that changes made in the container are also visible on your host machine
* Using the VS Code [Docker](https://code.visualstudio.com/docs/containers/overview) and [Remote Development](https://code.visualstudio.com/docs/remote/remote-overview) extension is recommended, to attach shells or VS code itself to the container.
* Note that [franka_ros2](https://frankaemika.github.io/docs/franka_ros2.html#) is currently (08/2023) beta software and might yet encounter issues.
