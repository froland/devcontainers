FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-24.04

# Install dependencies
RUN --mount=type=cache,target=/var/cache/apt \
  apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    biber \
    chktex \
    gir1.2-gtk-3.0 \
    gir1.2-poppler-0.18 \
    gobject-introspection \
    graphicsmagick \
    latexmk \
    libcairo2 \
    libfile-homedir-perl \
    libgirepository-1.0-1 \
    libgtk-3-0 \
    libpoppler-glib8 \
    libpango-perl \
    libyaml-tiny-perl \
    pympress \
    python3-gi \
    python3-gi-cairo \
    python3-pygments

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
