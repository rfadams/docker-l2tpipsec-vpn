#!/bin/sh

FROM ubuntu:12.04
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl wget 

# IPSec / L2TP 
RUN apt-get install -y openswan xl2tpd 

# Identified dependencies for IPSec / L2TP
RUN apt-get install -y lsof iptables ufw

# Debugging tools
RUN apt-get install -y vim netcat nmap net-tools

RUN apt-get install -y ppp

ADD ipsec.conf /etc/ipsec.conf
ADD ipsec.secrets /etc/ipsec.secrets
ADD options.xl2tpd /etc/ppp/options.xl2tpd
ADD chap-secrets /etc/ppp/chap-secrets

ADD ./bin /usr/local/sbin

EXPOSE 500/udp 4500/udp 1701/udp

CMD run
