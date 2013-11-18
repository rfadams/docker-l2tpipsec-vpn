#!/bin/sh

FROM ubuntu:12.04
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl 

RUN apt-get install -y iptables ufw

RUN apt-get install -y openswan xl2tpd lsof

ADD ipsec.conf /etc/ipsec.conf
ADD ipsec.secrets /etc/ipsec.secrets

ADD ./bin /usr/local/sbin
RUN bash stop-redirects

EXPOSE 500/udp 4500/udp

RUN mkdir -p /lib/modules/3.8.0-33-generic
RUN depmod -a

RUN apt-get install -y vim nano netcat nmap net-tools

RUN curl -L http://git.io/portserver > /usr/local/sbin/portserver.py
RUN chmod 744 /usr/local/sbin/portserver.py

CMD run

# RUN ipsec verify


# RUN curl -L http://git.io/portserver > portserver.py
# EXPOSE 10000
# CMD ["python", "portserver.py"]


# Was writing bash script to replace YOUR.IP.ADDRESS with current one

