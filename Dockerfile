FROM openjdk:8-jdk-alpine

VOLUME /tmp

ADD target/springbootdockerdemo-0.0.1-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""

# To reduce Tomcat startup time we added a system property pointing to "/dev/urandom" as a source of entropy.
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]