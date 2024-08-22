FROM mcr.microsoft.com/vscode/devcontainers/java-bookworm:21
RUN --mount=type=cache,target=/var/cache/apt\
  apt-get update \
  && apt-get install -y --no-install-recommends \
    fonts-noto-cjk \
    graphviz
WORKDIR /plantuml
RUN wget https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar
RUN chown -R vscode:vscode /plantuml
USER vscode
CMD java -jar plantuml.jar -picoweb:9108
