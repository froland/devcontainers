FROM froland/devcontainer-latex:latest

ENV DISPLAY=host.docker.internal:0
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  auto-multiple-choice \
  libopenoffice-oodoc-perl \
  libreoffice-calc \
  && rm -rf /var/lib/apt/lists/*
COPY .AMC.d /home/vscode/.AMC.d
RUN chown -R vscode:vscode /home/vscode/.AMC.d
ENTRYPOINT ["/usr/bin/auto-multiple-choice"]
