FROM froland/devcontainer-latex:latest

ARG DOCKER_LANG=en_US

ENV LANG=$DOCKER_LANG.UTF-8
ENV LANGUAGE=$DOCKER_LANG:UTF-8
ENV LC_ALL=$DOCKER_LANG.UTF-8
ENV TZ=Europe/Brussels

ADD --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d

# Install desktop packages
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    at-spi2-core \
    auto-multiple-choice \
    ca-certificates \
    curl \
    dbus-x11 \
    default-jre \
    eog \
    eterm \
    evince \
    fbautostart \
    fonts-droid-fallback \
    fonts-noto \
    fonts-noto-color-emoji \
    fonts-wqy-microhei \
    fluxbox \
    gnome-icon-theme \
    gnome-keyring \
    htop \
    libasound2-dev \
    libgbm-dev \
    libnotify4 \
    libnss3 \
    libopenoffice-oodoc-perl \
    libreoffice-calc \
    libreoffice-gtk3 \
    libreoffice-java-common \
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
    xterm \
  && rm -rf /var/lib/apt/lists/*

# Reinitialize font db
RUN su vscode -c "lualatex --draftmode --interaction=nonstopmode --output-directory=/tmp '\documentclass{article}\begin{document}Hello, world!\end{document}'"
