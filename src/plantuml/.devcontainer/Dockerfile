FROM froland/devcontainer-java:latest
RUN apt-get update \
  && apt-get install -y --no-install-recommends fonts-noto-cjk graphviz \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /plantuml
RUN chown vscode:vscode /plantuml
RUN su vscode -c "umask 0002 \
  && . ${SDKMAN_DIR}/bin/sdkman-init.sh \
  && git clone https://github.com/plantuml/plantuml-server.git \
  && cd plantuml-server \
  && mvn dependency:go-offline"
USER vscode
WORKDIR /plantuml/plantuml-server
CMD mvn --batch-mode jetty:run
