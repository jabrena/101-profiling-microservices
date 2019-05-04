#!/usr/bin/env bash

echo "Script"

# Regenerate Jar with latest changes
./gradlew clean build

# -XX:+PrintGCDetails

# -XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC
# -XX:+UnlockExperimentalVMOptions -XX:+UseZGC
# -XX:+UseG1GC
# -XX:+UseParallelGC
# -XX:+UseConcMarkSweepGC
# -XX:+PrintGCDetails

# Run Jar
java -version
java -Xms256m -Xmx512m \
-verbose:gc  \
-XX:-DisableExplicitGC \
-XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC \
-XX:OnError="echo Katakroker" \
-XX:OnOutOfMemoryError="echo Katakroker OutOf Memory" \
-XX:HeapDumpPath=./java_pid.hprof \
-XX:-HeapDumpOnOutOfMemoryError \
-Djava.security.egd=file:/dev/./urandom \
-Dcom.sun.management.jmxremote=true \
-Dcom.sun.management.jmxremote.port=7091 \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false \
-Djava.awt.headless=true \
-jar ./build/libs/101-profiling-microservices-0.1.0-SNAPSHOT.jar
