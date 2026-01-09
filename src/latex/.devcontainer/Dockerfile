FROM froland/devcontainer-base

# Install dependencies
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
  biber \
  chktex \
  gir1.2-gtk-3.0 \
  gir1.2-poppler-0.18 \
  gobject-introspection \
  graphicsmagick \
  imagemagick \
  inkscape \
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
  python3-pygments \
  python3-venv \
  texlive \
  texlive-bibtex-extra \
  texlive-extra-utils \
  texlive-font-utils \
  texlive-fonts-extra \
  texlive-fonts-extra-links \
  texlive-lang-french \
  texlive-latex-extra \
  texlive-luatex \
  texlive-pstricks \
  texlive-publishers \
  texlive-science \
  && rm -rf /var/lib/apt/lists/*

# Initialize font db
RUN su vscode -c "lualatex --draftmode --interaction=nonstopmode --output-directory=/tmp '\documentclass{article}\begin{document}Hello, world!\end{document}'"

ENTRYPOINT ["/usr/bin/zsh"]
