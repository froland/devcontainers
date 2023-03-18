FROM froland/devcontainer-java:latest
RUN apt-get update \
  && apt-get install -y --no-install-recommends fonts-noto-cjk graphviz \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /plantuml
RUN wget https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar
RUN chown -R vscode:vscode /plantuml
USER vscode
CMD java -jar plantuml.jar -picoweb:9108
