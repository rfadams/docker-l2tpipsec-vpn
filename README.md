# Docker L2TP / IPSec VPN server

This is still a work in progress, a successful connection has not been made.

### Current Work
1. Setup Docker using https://docs.docker.io/en/latest/installation/ubuntulinux/ on EC2 12.04 Ubuntu  
1. Using Dockerfile to setup and configure VPN container
1. Run command modifies config files to add container's ip address

### Relevant Commands
1. sudo ufw allow 22; sudo ufw allow 4500; sudo ufw allow 500; sudo ufw enable;
1. Open all TCP & UDP connections on EC2 Security group
1. docker build -t vpn .
1. docker run -privileged -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules vpn

### References for setting up L2TP / IPSec VPN
- https://help.ubuntu.com/community/L2TPServer
- http://riobard.com/2010/04/30/l2tp-over-ipsec-ubuntu/ 
- http://blog.docker.io/2013/09/docker-joyent-openvpn-bliss/
- https://github.com/xelerance/Openswan/wiki/Amazon-ec2-example
