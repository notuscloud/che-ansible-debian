FROM debian:9.6

MAINTAINER thomas@notuscloud.fr

# Add some packages
RUN apt update && \ 
    apt install -y vim procps curl zsh git wget unzip openjdk-8-jre-headless gnupg gnupg2 gnupg1

# Add ansible user
RUN useradd ansible -s /bin/bash -b /home -m

# Install ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && apt-get -y install ansible && ansible --version

# CMD
CMD tail -f /dev/null
