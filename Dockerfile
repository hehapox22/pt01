FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server sudo
RUN mkdir /var/run/sshd
#RUN useradd -rm -d /home/$(whoami) -s /bin/bash -g root -G sudo -u 1000 $(whoami)
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
