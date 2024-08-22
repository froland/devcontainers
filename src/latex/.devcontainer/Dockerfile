FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install dependencies
RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    biber \
    chktex \
    graphicsmagick \
    latexmk \
    libyaml-tiny-perl \
    libfile-homedir-perl \
    libpango-perl

# Install texlive packages
RUN --mount=type=cache,target=/var/cache/apt DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    texlive \
    texlive-bibtex-extra \
    texlive-extra-utils \
    texlive-font-utils \
    texlive-fonts-extra \
    texlive-fonts-extra-links \
    texlive-lang-french \
    texlive-latex-extra \
    texlive-pstricks \
    texlive-publishers \
    texlive-science \
    texlive-xetex

ENTRYPOINT ["/usr/bin/zsh"]
