# libfranka-docker
Docker Image with installed libfranka v0.10.0.

To build the container, run 

	docker-compose up

in the `docker_launch_files` directory. To enable display mounting, run

	xhost +local:docker
	
on the host machine.
