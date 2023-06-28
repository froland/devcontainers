FROM froland/devcontainer-java:latest
RUN su vscode -c "umask 0002 \
  && corepack enable \
  && corepack prepare pnpm@latest --activate"
