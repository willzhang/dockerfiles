FROM maven:3.6.3-jdk-11-slim

ENV DOCKER_VERSION=19.03.13

COPY settings.xml /usr/share/maven/ref/

RUN curl -f https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar xvz && \
    mv docker/docker /usr/bin/ && \
    rm -rf docker
