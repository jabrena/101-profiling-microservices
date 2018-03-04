FROM anapsix/alpine-java
MAINTAINER Juan Antonio Breña Moral
EXPOSE 8080
COPY ./build/libs/101-profiling-microservices-0.1.0-SNAPSHOT.jar /home/101-profiling-microservices-0.1.0-SNAPSHOT.jar
CMD ["java","-jar","/home/101-profiling-microservices-0.1.0-SNAPSHOT.jar"]