FROM ubuntu:22.04
LABEL maintainer="citraemu"
ENV DEBIAN_FRONTEND=noninteractive

# Create a user account citra (UID 1027) that the container will run as
RUN useradd -m -u 1027 -s /bin/bash citra 
RUN apt-get update && apt-get -y full-upgrade
RUN apt-get install -y \
    p7zip-full \
    build-essential \
    software-properties-common \
    libsdl2-dev \
    qtbase5-dev \
    qtbase5-private-dev \
    libqt5opengl5-dev \
    qtmultimedia5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    qt6-base-dev \
    qt6-base-private-dev \
    libqt6opengl6-dev \
    qt6-multimedia-dev \
    qt6-l10n-tools \
    qt6-tools-dev \
    qt6-tools-dev-tools \
    libavcodec-dev \
    libavfilter-dev \
    libavformat-dev \
    libswscale-dev \
    wget \
    git \
    ccache \
    cmake \
    ninja-build \
    clang \
    lld \
    && \
# Install updated version of glslang
    add-apt-repository -y ppa:theofficialgman/gpu-tools && \
    apt-get update -y && \
    apt-get install --no-install-recommends -y \
    glslang-dev \
    glslang-tools
