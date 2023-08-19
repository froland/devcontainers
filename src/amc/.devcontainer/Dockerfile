FROM froland/devcontainer-latex:latest

ARG DOCKER_LANG=en_US

ENV LANG=$DOCKER_LANG.UTF-8
ENV LANGUAGE=$DOCKER_LANG:UTF-8
ENV LC_ALL=$DOCKER_LANG.UTF-8

RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
    auto-multiple-choice \
    libopenoffice-oodoc-perl \
    libreoffice-calc \
  && rm -rf /var/lib/apt/lists/*
ADD --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d
