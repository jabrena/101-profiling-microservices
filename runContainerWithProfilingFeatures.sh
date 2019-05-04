#!/usr/bin/env bash

echo "Running Multiple Docker Images"

# Regenerate Jar with latest changes
./gradlew clean build

#Stop/Remove
docker stop profiling
docker rm profiling

# Build Docker Java8
docker build . -t profiling

export JAVA_OPTS="$JAVA_OPTS\
 -XX:+PrintFlagsFinal\
 -XX:+UnlockExperimentalVMOptions\
 -XX:+UseCGroupMemoryLimitForHeap\
 -Xms256m\
 -Xmx256m\
 -verbose:gc\
 -XX:-DisableExplicitGC\
 -XX:HeapDumpPath=./java_pid.hprof\
 -XX:-HeapDumpOnOutOfMemoryError\
 -Djava.security.egd=file:/dev/./urandom\
 -Dcom.sun.management.jmxremote.rmi.port=7092\
 -Dcom.sun.management.jmxremote=true\
 -Dcom.sun.management.jmxremote.port=7092\
 -Dcom.sun.management.jmxremote.ssl=false\
 -Dcom.sun.management.jmxremote.authenticate=false\
 -Dcom.sun.management.jmxremote.local.only=false\
 -Djava.rmi.server.hostname=localhost\
 -Djava.awt.headless=true"

# Run Container
docker run -p 8080:8080 -p 7092:7092 -e JAVA_OPTS="$JAVA_OPTS" --name profiling profiling

#Logs
#docker logs profiling




