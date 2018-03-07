#!/usr/bin/env bash

echo "Script"

# Regenerate Jar with latest changes
./gradlew clean build

set JAVA_OPTS=""

# Build Docker
docker build . -t profiling

# Run Container
docker run --name profiling -p 8080:8080 -p 9010:9010 -p 5005:5005 profiling



