FROM adoptopenjdk/openjdk8:jdk8u212-b03

MAINTAINER Juan Antonio Breña Moral

EXPOSE 8080
EXPOSE 7092
ADD build/libs/101-profiling-microservices-0.1.0-SNAPSHOT.jar /opt/101-profiling-microservices-0.1.0-SNAPSHOT.jar
WORKDIR /opt
ENTRYPOINT exec java $JAVA_OPTS -jar 101-profiling-microservices-0.1.0-SNAPSHOT.jar