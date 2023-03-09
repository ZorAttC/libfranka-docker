# libfranka-docker
Docker Images with installed libfranka v0.10.0 and ROS 2 extensions.

To build the containers, run 

	docker-compose up

in the respective `docker_launch_files` directory. To enable display mounting, run

	xhost +local:docker
	
on the host machine.
