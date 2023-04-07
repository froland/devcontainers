FROM froland/devcontainer-latex:latest

ENV DISPLAY :20
COPY --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d
COPY --chown=vscode:vscode --chmod=0755 entrypoint.sh /home/vscode/entrypoint.sh
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  auto-multiple-choice \
  fluxbox \
  libopenoffice-oodoc-perl \
  libreoffice-calc \
  x11vnc \
  xvfb \
  && rm -rf /var/lib/apt/lists/*
USER vscode
WORKDIR /home/vscode/novnc
ADD https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz /tmp/novnc.tar.gz
RUN tar -xzf /tmp/novnc.tar.gz --strip-components=1
EXPOSE 6900/tcp
ENTRYPOINT ["/home/vscode/entrypoint.sh"]
CMD ["sleep", "infinity"]