###
# StarCraft II Learning Environment (SC2LE)
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
 cmake \
 sudo \
 && useradd -m docker \
 && echo "docker:docker" | chpasswd \
 && adduser docker sudo

# Download and install starcraft headless build
RUN wget http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.10.zip && \
unzip -P iagreetotheeula SC2.4.10.zip -d ~/ && \
rm *.zip

# Download and install starcraft maps
COPY maps.txt maps.txt

RUN wget -i maps.txt && \
grep -E '[a-zA-Z0-9\_]+\.zip' maps.txt -o | xargs -I '{}' unzip -P iagreetotheeula -o '{}' -d ~/StarCraftII/Maps/ && \
rm *.zip && \
rm maps.txt

# Expose the API listen port
EXPOSE 12000

# Start SC2 with API listen port
ENTRYPOINT [ "/root/StarCraftII/Versions/Base75689/SC2_x64", \
    "-listen", \
    "0.0.0.0", \
    "-port", \
    "12000" ]
