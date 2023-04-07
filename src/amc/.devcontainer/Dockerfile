FROM froland/devcontainer-latex:latest

ENV DISPLAY=host.docker.internal:0
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  auto-multiple-choice \
  fluxbox \
  libopenoffice-oodoc-perl \
  libreoffice-calc \
  x11vnc \
  xvfb
  && rm -rf /var/lib/apt/lists/*
ENV DISPLAY :20
COPY --chown=vscode:vscode .AMC.d /home/vscode/.AMC.d
COPY --chown=vscode:vscode --chmod=0755 entrypoint.sh /home/vscode/entrypoint.sh
ENTRYPOINT ["/home/vscode/entrypoint.sh"]
