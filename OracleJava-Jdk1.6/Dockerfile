# LICENSE UPL 1.0
#
# Copyright (c) 2015 Oracle and/or its affiliates. All rights reserved.
#
FROM oraclelinux:7-slim

MAINTAINER Aurelio Garcia-Ribeyro <aurelio.garciaribeyro@oracle.com>

ENV JAVA_PKG=jdk-6u45-linux-x64.bin \
    JAVA_HOME=/usr/java/default

ADD $JAVA_PKG /usr/java/

RUN cd /usr/java/ && \
    chmod +x /usr/java/$JAVA_PKG && \
    sh $JAVA_PKG && \
    rm $JAVA_PKG && \
    export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default && \
    alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000
