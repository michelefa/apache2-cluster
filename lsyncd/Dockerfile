#FROM ubuntu:16.04
FROM phusion/baseimage:latest

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install lsyncd -y

#Create folder for lsyncd
RUN mkdir /etc/lsyncd
RUN mkdir /var/log/lsyncd

#Install supervisor
RUN apt-get install apt-utils -y
RUN apt-get install supervisor -y
RUN apt-get install openssh-server -y
RUN mkdir -p /var/log/supervisor /var/run/sshd
ADD lsync_start /var/run/lsync_start
RUN chmod +x /var/run/lsync_start

#Install an SSH of your choice.
ADD /keys/id_rsa.pub /tmp/your_key.pub
RUN cat /tmp/your_key.pub >> /root/.ssh/authorized_keys && rm -f /tmp/your_key.pub

##known_hosts
ADD /keys/known_hosts /tmp/known_hosts
RUN cat /tmp/known_hosts >> /root/.ssh/known_hosts && rm -f /tmp/known_hosts

#private key
ADD /keys/id_rsa /tmp/id_rsa
RUN cat /tmp/id_rsa >> /root/.ssh/id_rsa && rm -f /tmp/id_rsa
RUN chmod 700 /root/.ssh/id_rsa

#Disable known_hosts verification
ADD ssh.conf /root/.ssh/config

#temp tools
#RUN apt-get install  net-tools -y
#RUN apt-get install iputils-ping -y
#RUN apt-get install vim -y

Expose 22
CMD ["/usr/bin/supervisord"]
