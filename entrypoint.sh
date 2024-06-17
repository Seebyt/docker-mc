#!/bin/sh

cd /app 

mv /download/server.jar /app/server.jar
echo "eula=true" > /app/eula.txt

java -Xmx1024M -Xms1024M -jar /app/server.jar -nogui