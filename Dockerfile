#FROM xlate/openj9
FROM anapsix/alpine-java
#FROM pwittchen/alpine-java9
MAINTAINER Juan Antonio Breña Moral

ADD build/libs/*.jar app.jar

# -XX:+PrintGCDetails

ENTRYPOINT java -Xms256m -Xmx256m \
    -verbose:gc  \
    -XX:+UseG1GC -XX:-DisableExplicitGC \
    -Djava.security.egd=file:/dev/./urandom \
    -Dsun.management.jmxremote.level=FINEST \
    -Dsun.management.jmxremote.handlers=java.util.logging.ConsoleHandler \
    -Djava.util.logging.ConsoleHandler.level=FINEST \
    -Dcom.sun.management.jmxremote.local.only=false \
    -Dcom.sun.management.jmxremote=true \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.port=9010 \
    -Dcom.sun.management.jmxremote.rmi.port=9010 \
    -Dcom.sun.management.jmxremote.host=0.0.0.0 \
    -Djava.rmi.server.hostname=0.0.0.0 \
    -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 \
    -server \
    -jar -jar app.jar
