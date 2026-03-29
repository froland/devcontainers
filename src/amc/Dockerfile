FROM froland/devcontainer-latex:latest

ARG DOCKER_LANG=en_US

ENV LANG=$DOCKER_LANG.UTF-8
ENV LANGUAGE=$DOCKER_LANG:UTF-8
ENV LC_ALL=$DOCKER_LANG.UTF-8
ENV TZ=Europe/Brussels

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
  libc6 \
  libcairo2 \
  libemail-address-perl \
  libemail-mime-perl \
  libemail-sender-perl \
  libgbm-dev \
  libgcc-s1 \
  libglib2.0-0t64 \
  libnotify4 \
  libnss3 \
  libopencv-core410 \
  libopencv-imgcodecs410 \
  libopencv-imgproc410 \
  libopenoffice-oodoc-perl \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libpoppler-glib8t64 \
  libreoffice-calc \
  libreoffice-gtk3 \
  libreoffice-java-common \
  libsecret-1-dev \
  libstdc++6 \
  libx11-dev \
  libxkbfile-dev \
  libxss1 \
  locales \
  mousepad \
  nano \
  nautilus\
  ncdu \
  perl \
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
  xsltproc \
  xterm \
  && rm -rf /var/lib/apt/lists/*

USER vscode

ADD --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d
