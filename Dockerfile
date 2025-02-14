# Docker file for the Read Service
#
# Version 0.0.1

#jdk image
FROM openjdk:8-jdk-alpine

# install

# label for the image
LABEL Description="FMS GateWay" Version="0.0.1"

# the version of the archive
ARG VERSION=0.0.1

# mount the temp volume
VOLUME /tmp

# Add the service as app.jar
ADD target/*.jar app.jar

# touch the archive for timestamp
RUN sh -c 'touch /app.jar' 

# entrypoint to the image on run
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]