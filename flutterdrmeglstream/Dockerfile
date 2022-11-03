FROM ubuntu:20.04
MAINTAINER Kevin De Keyser§<kevin.dekeyser@zuehlke.com>

ENV DEBIAN_FRONTEND=noninteractive

ARG BUILDPLATFORM
ARG BUILDARCH
ARG BUILDOS
ARG BUILDVARIANT
ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
ARG TARGETVARIANT
RUN echo "Building on platform $BUILDPLATFORM  with architecture $BUILDARCH and OS $BUILDOS and variant $BUILDVARIANT."
RUN echo "Targetting platform $TARGETPLATFORM with architecture $TARGETARCH and OS $TARGETOS and variant $TARGETVARIANT."


RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y ca-certificates
# Installing yocto requirements for Ubuntu except for gcc-multilib: https://docs.yoctoproject.org/1.8/yocto-project-qs/yocto-project-qs.html#ubuntu
RUN apt-get -y install gawk wget git-core diffstat unzip texinfo  \
     build-essential chrpath socat libsdl1.2-dev xterm

# If architecture is arm64 (multilib does not support arm64).
# RUN apt-get -y install gcc-11 g++-11
RUN apt-get -y install gcc-multilib

# RUN apt-get -y install gcc-multilib
# Installing flutter-meta dependencies
RUN apt-get -y upgrade && apt-get -y install lz4
# Unmentioned dependencies
RUN apt-get -y upgrade && apt-get -y install cpio file zstd

# extras
# RUN apt-get -y upgrade && apt-get -y install gawk wget git-core diffstat unzip texinfo build-essential chrpath socat cpio python3 python3-pip python3-pexpect python-is-python3 python3-git python3-jinja2 xz-utils debianutils iputils-ping libegl1-mesa libsdl1.2-dev xterm curl

RUN apt-get update && apt-get install -y tzdata gawk wget git-core diffstat \
            unzip curl rpm texinfo build-essential chrpath socat \
            cpio python python-git-doc python3 python3-pip python3-pexpect \
            python3-virtualenv p7zip-full p7zip-rar jq \
            python3-git python3-jinja2 xz-utils debianutils iputils-ping \
            xterm locales libdatetime-perl libxml-simple-perl libdigest-md5-perl \
            nano gettext cmake libjson-c-dev libmicrohttpd-dev rapidjson-dev \
            libegl1-mesa libsdl1.2-dev libxkbcommon-dev \
            xsltproc docbook-utils fop dblatex xmlto \
            lsb-release software-properties-common rsync srecord gdisk \
            lz4 zstd libmpc-dev pylint bsdmainutils libgmp-dev  libssl-dev
RUN pip3 install virtualenv

RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 12

RUN apt-get install -y libwayland-dev wayland-protocols \
            mesa-common-dev libegl1-mesa-dev libgles2-mesa-dev mesa-utils \
            libcurl4-openssl-dev libjpeg-turbo8-dev libpng-dev libsqlite3-dev \
            libssl-dev libfreetype6-dev libharfbuzz-dev libxi-dev \
            libc++-12-dev libc++abi-12-dev libunwind-dev ninja-build

# RUN adduser --disabled-password --gecos '' -u ${RUNNER_UID} dev
# RUN chown -R dev:dev /home/dev
# RUN locale-gen en_US.UTF-8

# ENV LANG en_US.UTF-8

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get update && apt-get install -y git-lfs



CMD ["bash"]
RUN apt-get install -y curl dosfstools mtools parted tree zip # buildkit
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
COPY drmeglstream.sh /home/build/drmeglstream.sh
