FROM ubuntu:16.04
ENV LANG C.UTF-8
ADD docker.sh /
ADD git /build/borg
RUN bash -e -x /docker.sh
