FROM ubuntu:latest

RUN apt-get update \
        && apt install -y --no-install-recommends \
            apt-transport-https \
            ca-certificates \
            build-essential \
            wget \
            gnupg \
            gpg-agent \
            unzip

# Adapted from https://github.com/scottyhardy/docker-wine/blob/master/Dockerfile
# Install wine
ARG WINE_BRANCH="stable"
ARG C64LIST_VER="4.04"
RUN wget -nv -O- https://dl.winehq.org/wine-builds/winehq.key | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - \
    && echo "deb https://dl.winehq.org/wine-builds/ubuntu/ $(grep VERSION_CODENAME= /etc/os-release | cut -d= -f2) main" >> /etc/apt/sources.list \
    && dpkg --add-architecture i386 \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --install-recommends wine-${WINE_BRANCH}

COPY files/C64List${C64LIST_VER}/Win32/C64List.exe /bin/C64List.exe
