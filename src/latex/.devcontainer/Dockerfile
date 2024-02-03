FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
    biber \
    chktex \
    graphicsmagick \
    latexmk \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libpango-perl \
    texlive \
    texlive-bibtex-extra \
    texlive-extra-utils \
    texlive-fonts-extra \
    texlive-fonts-extra-links \
    texlive-lang-french \
    texlive-latex-extra \
    texlive-luatex \
    texlive-pstricks \
    texlive-publishers \
    texlive-science \
    texlive-xetex
ENTRYPOINT ["/usr/bin/zsh"]
