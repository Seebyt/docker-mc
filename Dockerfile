# Stage 1: Download the server.jar using Alpine
FROM alpine:3.18 AS BUILD

WORKDIR /download

# Add the Edge community repository for openjdk21

# Update repositories and install openjdk21
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk add --no-cache openjdk21
RUN apk --no-cache add curl 
# RUN apk add openjdk21-jre --update-cache --repository https://pkgs.alpinelinux.org/package/edge/community/x86_64/openjdk21-jre --allow-untrusted

# Download the Minecraft server.jar
RUN curl -O https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar 

COPY entrypoint.sh /download/entrypoint.sh
RUN chmod +x /download/entrypoint.sh

# Stage 2: Create final image using Distroless Java
# FROM gcr.io/distroless/java17-debian12
# Copy the server.jar from the build stage
# COPY --from=BUILD --chown=0755 server.jar server.jar

# Expose port 25565
EXPOSE 25565

# Define the command to run the Minecraft server
ENTRYPOINT ["./entrypoint.sh"]
