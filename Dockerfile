#!/bin/sh

FROM ubuntu:12.04
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl 

RUN apt-get install -y openswan xl2tpd lsof iptables ufw

ADD ipsec.conf /etc/ipsec.conf
ADD ipsec.secrets /etc/ipsec.secrets

ADD ./bin /usr/local/sbin
RUN bash stop-redirects

EXPOSE 500/udp 4500/udp

# Some modules were not found, needed to create dir first
RUN mkdir -p /lib/modules/3.8.0-33-generic 

# Creates modules that resolved a problem with ipsec
RUN depmod -a

# Various tools to help with network debugging (will be removed upon success)
RUN apt-get install -y vim netcat nmap net-tools

CMD run
