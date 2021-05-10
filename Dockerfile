FROM python:3.9.5-alpine3.12
MAINTAINER simonweald@giantswarm.io

ENV ESRALLY_VER=1.4.0

RUN apk add --update --no-cache build-base linux-headers python3-dev git && \
    rm -rf /var/lib/apt/lists/*
RUN pip install esrally==$ESRALLY_VER
RUN adduser -s /bin/bash -D -u 2000 esrally && \
    mkdir -p /home/esrally/.rally/ && \
    chown -R esrally.esrally /home/esrally/.rally/

USER 2000
