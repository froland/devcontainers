FROM froland/devcontainer-latex:latest

ARG DOCKER_LANG=en_US

ENV LANG=$DOCKER_LANG.UTF-8
ENV LANGUAGE=$DOCKER_LANG:UTF-8
ENV LC_ALL=$DOCKER_LANG.UTF-8
ENV TZ=Europe/Brussels

ADD --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d

# Install desktop packages
RUN --mount=type=cache,target=/var/cache/apt apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    at-spi2-core \
    ca-certificates \
    curl \
    dbus-x11 \
    eterm \
    fbautostart \
    fonts-droid-fallback \
    fonts-noto \
    fonts-noto-color-emoji \
    fonts-wqy-microhei \
    fluxbox \
    gnome-icon-theme \
    gnome-keyring \
    htop \
    libasound2 \
    libgbm-dev \
    libnotify4 \
    libnss3 \
    libsecret-1-dev \
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
    tilix \
    unzip \
    x11-utils \
    x11-xserver-utils \
    xdg-utils \
    xfonts-base \
    xfonts-terminus \
    xterm

# Install utilities
RUN --mount=type=cache,target=/var/cache/apt DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    default-jre \
    eog \
    evince \
    libopenoffice-oodoc-perl \
    libreoffice-calc \
    libreoffice-gtk3 \
    libreoffice-java-common

# Install auto-multiple-choice
RUN --mount=type=cache,target=/var/cache/apt DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    auto-multiple-choice
