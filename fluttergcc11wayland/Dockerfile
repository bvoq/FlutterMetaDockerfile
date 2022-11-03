FROM ubuntu:22.04
MAINTAINER Kevin De Keyser§<kevin.dekeyser@zuehlke.com>

ENV DEBIAN_FRONTEND=noninteractive

# Installing yocto requirements for Ubuntu: https://docs.yoctoproject.org/1.8/yocto-project-qs/yocto-project-qs.html#ubuntu
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ca-certificates
RUN apt-get -y install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm
# Installing flutter-meta dependencies
RUN apt-get -y upgrade && apt-get -y install lz4
# Unmentioned dependencies
RUN apt-get -y upgrade && apt-get -y install cpio file zstd

CMD ["bash"]
RUN apt-get install -y curl dosfstools mtools parted syslinux tree zip # buildkit
RUN curl http://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo # buildkit
RUN chmod a+x /usr/local/bin/repo # buildkit
RUN id jenkins 2>/dev/null || useradd --uid 1000 --create-home jenkins # buildkit
RUN id build 2>/dev/null || useradd --uid 30000 --create-home build # buildkit
RUN apt-get install -y sudo # buildkit
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers # buildkit


# Install repo
# RUN curl http://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
# RUN chmod a+x /usr/local/bin/repo
# RUN id jenkins 2>/dev/null || useradd --uid 1000 --create-home jenkins
# RUN id build 2>/dev/null || useradd --uid 30000 --create-home build
# RUN apt-get install -y sudo
# RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers 


# Set up locales
RUN apt-get -y install locales apt-utils sudo && dpkg-reconfigure locales && locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && echo 'LANG="en_US.UTF-8"'>/etc/default/locale && dpkg-reconfigure --frontend=noninteractive locales && update-locale LANG=en_US.UTF-8 # buildkit
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Clean up APT when done.
RUN apt-get clean # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# additional packages required for flutter-meta
#RUN apt install -y lz4 zstd file
#RUN apt install -y gcc-11 g++-11
# RUN apt-get -y install libzlz4
# RUN apt-get -y install gcc g++
# RUN sudo apt update
# RUN sudo apt-get install -y lz4

USER build
WORKDIR /home/build
COPY wayland.sh /home/build/wayland.sh
