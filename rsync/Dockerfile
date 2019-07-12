FROM alpine
MAINTAINER Instrumentisto Team <developer@instrumentisto.com>

RUN apk update \
 && apk add --no-cache \
            rsync \
            openssh-client \
            expect \
 && rm -rf /var/cache/apk/*
