# docker-mc
Simple Dockerfile for Java Minecraft server

*USAGE*

docker build -t mc .

docker run --rm -it -p 25565:25565  -v ./mc/server1:/app mc

