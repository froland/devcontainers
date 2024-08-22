FROM mcr.microsoft.com/vscode/devcontainers/java:21-jdk-bookworm

RUN su vscode -c "umask 0002 \
  && . ${SDKMAN_DIR}/bin/sdkman-init.sh \
  && sdk install maven \
  && sdk flush archives \
  && sdk flush temp"
