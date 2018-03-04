#!/usr/bin/env bash

echo "Script"

# Regenerate Jar with latest changes
./gradlew clean compileJava bootJar

set JAVA_OPTS=""

# Run Jar
java -Xms256m -Xmx256m -verbose:gc -XX:+UseG1GC -XX:-DisableExplicitGC \
-Dcom.sun.management.jmxremote=true \
-Dcom.sun.management.jmxremote.port=7091 \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false \
-server \
-jar ./build/libs/101-profiling-microservices-0.1.0-SNAPSHOT.jar


