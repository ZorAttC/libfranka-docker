# libfranka-docker
Docker Images with installed libfranka v0.10.0 and ROS/ROS2 extensions.

To build the containers, run 

	docker-compose up

in the respective `docker_launch_files` directory. The only requirements on the host machine is to have a realtime capable kernel and to have [Docker](https://docs.docker.com/get-docker/) with [Compose](https://docs.docker.com/compose/install/) plugin installed. To enable display mounting (e.g. for RVIZ), run

	xhost +local:docker
	
on the host machine (note that display mounting only works on Ubunut systems). 

Using the VS Code [Dev Container](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension is recommended. 

Note that [franka_ros2](https://frankaemika.github.io/docs/franka_ros2.html#) is currently (03/2023) beta software.
