FROM froland/devcontainer-latex:latest

ARG DOCKER_LANG=en_US

ENV DISPLAY=:20
ENV LANG=$DOCKER_LANG.UTF-8
ENV LANGUAGE=$DOCKER_LANG:UTF-8
ENV LC_ALL=$DOCKER_LANG.UTF-8

RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
    auto-multiple-choice \
    fluxbox \
    libopenoffice-oodoc-perl \
    libreoffice-calc \
    x11-xserver-utils \
    x11vnc \
    xserver-xorg-video-dummy \
  && rm -rf /var/lib/apt/lists/*
USER vscode
COPY --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d
COPY --chown=vscode:vscode --chmod=0755 entrypoint.sh /home/vscode/entrypoint.sh
ADD --chown=vscode:vscode noVNC-1.4.0.tar.gz /home/vscode/
EXPOSE 6900/tcp
ENTRYPOINT ["/home/vscode/entrypoint.sh"]
CMD ["sleep", "infinity"]
