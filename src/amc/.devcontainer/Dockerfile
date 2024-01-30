FROM froland/devcontainer-latex:latest

ARG DOCKER_LANG=en_US

ENV LANG=$DOCKER_LANG.UTF-8
ENV LANGUAGE=$DOCKER_LANG:UTF-8
ENV LC_ALL=$DOCKER_LANG.UTF-8

RUN --mount=type=cache,target=/var/cache/apt\
  apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
    at-spi2-core \
    auto-multiple-choice \
    ca-certificates\
    curl \
    dbus-x11 \
    default-jre \
    eterm \
    fbautostart \
    fluxbox \
    fonts-noto \
    fonts-wqy-microhei \
    fonts-droid-fallback \
    gnome-icon-theme \
    gnome-keyring \
    htop \
    libasound2 \
    libgbm-dev \
    libnotify4 \
    libnss3 \
    libopenoffice-oodoc-perl \
    libsecret-1-dev \
    libreoffice-calc \
    libreoffice-gtk3 \
    libreoffice-java-common \
    libx11-dev \
    libxkbfile-dev \
    libxss1 \
    locales \
    mousepad \
    nano \
    nautilus\
    ncdu \
    seahorse \
    tigervnc-common \
    tigervnc-standalone-server \
    tigervnc-tools \
    unzip \
    x11-utils \
    x11-xserver-utils \
    xdg-utils \
    xfonts-base \
    xfonts-terminus \
    xterm*
ADD --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d
