FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    make \
    zip \
    wget \
    git \
    ca-certificates \
    perl \
    libsdl-dev \
    gcc-mingw-w64 \
    g++-mingw-w64 \
    bzip2 \
    xz-utils \
    patch \
    texinfo \
    automake \
    libtool-bin \
    autoconf \
    flex \
    bison \
    && rm -rf /var/lib/apt/lists/*

ENV SDL2_VERSION=2.32.8
RUN wget https://www.libsdl.org/release/SDL2-${SDL2_VERSION}.tar.gz \
    && tar xzf SDL2-${SDL2_VERSION}.tar.gz \
    && cd SDL2-${SDL2_VERSION} \
    && ./configure --host=i686-w64-mingw32 --prefix=/opt/mingw32-sdl \
    && make -j$(nproc) && make install \
    && cd .. \
    && rm -rf SDL2-${SDL2_VERSION} SDL2-${SDL2_VERSION}.tar.gz

ENV PATH="/opt/mingw32-sdl/bin:${PATH}"

# Build the mipsel-elf cross toolchain (used for native Ingenic X1000 device
# builds, e.g. AIGO Eros Q / K Native) via Rockbox's own rockboxdev.sh.
RUN git clone --depth=1 git://git.rockbox.org/rockbox /tmp/rockbox \
    && RBDEV_PREFIX=/opt/rbtoolchain RBDEV_TARGET=i /tmp/rockbox/tools/rockboxdev.sh \
    && rm -rf /tmp/rockbox /tmp/rbdev-dl /tmp/rbdev-build

ENV PATH="/opt/rbtoolchain/bin:${PATH}"
