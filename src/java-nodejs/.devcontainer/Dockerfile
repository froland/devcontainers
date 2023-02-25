FROM froland/devcontainer-java:latest

RUN su vscode -c "umask 0002 \
  && nvm install 'lts/*' \
  && nvm cache clear"
