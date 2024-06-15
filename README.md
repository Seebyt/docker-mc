# docker-mc
Simple Dockerfile for Java Minecraft server

*USAGE*

docker build -t mcserver .
docker run --rm -it -p 25565:25565  -v /mc/data/server1:/mount mcserver

