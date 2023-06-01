FROM archlinux:latest
LABEL maintainer="citraemu"

# Add mingw-repo "ownstuff" is a AUR with an up to date mingw64
# Runs pacman -Syu twice in order to work around pacman issues where the first run only updates the
# current distro packages, and the second run actually pulls the updates from the repos.
RUN useradd -m -u 1027 -s /bin/bash citra && mkdir -p /tmp/pkgs && \
    echo "[ownstuff]" >> /etc/pacman.conf && \
    echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf && \
    echo "Server = https://martchus.no-ip.biz/repo/arch/ownstuff/os/\$arch" >> /etc/pacman.conf && \
    echo "[clang64]" >> /etc/pacman.conf && \
    echo "SigLevel = Optional TrustAll" >> /etc/pacman.conf && \
    echo "Server = https://repo.msys2.org/mingw/clang64" >> /etc/pacman.conf && \
    pacman -Syu --noconfirm && \
    pacman -Syu --noconfirm && \
    pacman -S --needed --noconfirm --noprogressbar \
    base-devel \
    sudo \
    gnupg \
    wget \
    git \
    glslang \
    python-pip \
    python \
    ccache \
    p7zip \
    cmake \
    ninja \
    qt6-base \
    qt6-tools \
    mingw-w64-boost \
    mingw-w64-gcc \
    mingw-w64-libusb \
    mingw-w64-lz4 \
    mingw-w64-nlohmann-json \
    mingw-w64-qt5-base \
    mingw-w64-qt5-multimedia \
    mingw-w64-qt5-tools \
    mingw-w64-qt5-winextras \
    mingw-w64-qt6-base \
    mingw-w64-qt6-multimedia \
    mingw-w64-qt6-tools \
    mingw-w64-tools \
    mingw-w64-sdl2 \
    mingw-w64-vulkan-headers \
    mingw-w64-winpthreads \
    mingw-w64-zlib \
    mingw-w64-zstd \
    mingw-w64-glslang \
    mingw-w64-clang-x86_64-qt6-base \
    mingw-w64-clang-x86_64-qt6-multimedia \
    mingw-w64-clang-x86_64-qt6-tools \
    && \
    pacman -Scc --noconfirm && \
    rm -rf /usr/share/man/ /tmp/* /var/tmp/ /usr/{i686-w64-mingw32,lib32} /usr/lib/gcc/i686-w64-mingw32 && \
    mkdir -p /tmp/pkgs
COPY mingw-setup.sh /tmp/pkgs
RUN cd /tmp/pkgs && bash -e mingw-setup.sh
