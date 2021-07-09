###
# Docker for StarCraft II Client
#
# Author: Álvaro Ferreira Pires de Paiva (alvarofepipa@gmail.com)
#
# Inspired by https://github.com/Frager/Deep-Neuroevolution-In-SC2LE/blob/master/Dockerfile
#
FROM ubuntu:20.04
MAINTAINER Álvaro FPP <alvarofepipa@gmail.com>

RUN apt-get update -yq \
 && apt-get install -yq \
 net-tools \
 htop \
 software-properties-common \
 wget \
 unzip \
 vim \
 nano \
 cmake \
 sudo \
 arandr \
 && useradd -m docker \
 && echo "docker:docker" | chpasswd \
 && adduser docker sudo

# Build arguments
ARG VERSION=4.10

# Script to download and install StarCraft II
COPY check_version.sh check_version.sh
COPY download_and_install.sh download_and_install.sh
COPY maps.txt maps.txt
RUN chmod +x /*.sh
RUN /check_version.sh download_and_install.sh

# Create the script to run the client
COPY run_client.sh run_client.sh
COPY replace_run_client.sh replace_run_client.sh
RUN chmod +x /*.sh
RUN /check_version.sh replace_run_client.sh

# Remove unused scripts
RUN rm download_and_install.sh replace_run_client.sh

# Expose the API listen port
ENV CLIENT_PORT 12000
EXPOSE $CLIENT_PORT

# Start SC2 with API listen port
ENTRYPOINT ["./run_client.sh"]
