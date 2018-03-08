#!/usr/bin/env bash

echo "Running Multiple Docker Images"

# Regenerate Jar with latest changes
./gradlew clean build

# Build Docker Java8
docker build . -t profiling

# Run Container
docker run --name profiling -p 8080:8080 -p 9010:9010 -p 5005:5005 profiling



