FROM ubuntu:22.04
MAINTAINER Kevin De Keyser§<kevin.dekeyser@zuehlke.com>

ENV DEBIAN_FRONTEND=noninteractive

# Upgrade system and Yocto Proyect basic dependencies + lz4 for
RUN apt-get update
RUN apt-get -y upgrade && apt-get -y install gawk wget git-core diffstat unzip texinfo build-essential chrpath socat cpio python3 python3-pip python3-pexpect python-is-python3 python3-git python3-jinja2 xz-utils debianutils iputils-ping libegl1-mesa libsdl1.2-dev xterm curl

# Install repo
RUN curl http://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo # buildkit
RUN chmod a+x /usr/local/bin/repo # buildkit
RUN id jenkins 2>/dev/null || useradd --uid 1000 --create-home jenkins # buildkit
RUN id build 2>/dev/null || useradd --uid 30000 --create-home build # buildkit
RUN apt-get install -y sudo # buildkit
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers # buildkit

# Set up locales
RUN apt-get -y install locales apt-utils sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && echo 'LANG="en_US.UTF-8"'>/etc/default/locale && dpkg-reconfigure --frontend=noninteractive locales && update-locale LANG=en_US.UTF-8 # buildkit
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Clean up APT when done.
RUN apt-get clean # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Replace dash with bash


#RUN mkdir -p /workdir
#RUN cd /workdir
#WORKDIR /workdir
## Install Poky
#RUN git clone --branch kirkstone git://git.yoctoproject.org/poky
#RUN git clone https://github.com/kraj/meta-clang -b kirkstone
#RUN git clone https://github.com/sony/meta-flutter.git

# additional packages
RUN apt install -y lz4 zstd file
RUN apt install -y gcc-11 g++-11
# RUN apt-get -y install libzlz4
# RUN apt-get -y install gcc g++
# RUN sudo apt update
# RUN sudo apt-get install -y lz4

USER build
WORKDIR /home/build
COPY wayland.sh /home/build/wayland.sh
WORKDIR /wayland
