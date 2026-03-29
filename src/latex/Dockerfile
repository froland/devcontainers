FROM froland/devcontainer-base

# Install dependencies
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
  gir1.2-gtk-3.0 \
  gir1.2-poppler-0.18 \
  gobject-introspection \
  graphicsmagick \
  imagemagick \
  inkscape \
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
  && rm -rf /var/lib/apt/lists/*

RUN cd tmp \
  && curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
  && zcat < install-tl-unx.tar.gz | tar xf - \
  && cd install-tl-2* \
  && perl ./install-tl --no-interaction \
  && rm -rf /tmp/install-tl*
RUN su vscode -c "echo 'PATH=$PATH:/usr/local/texlive/2026/bin/x86_64-linux' >> $HOME/.profile"
ADD --chown=vscode:vscode heh /tmp/heh
RUN su vscode -c "tlmgr init-usertree && cd /tmp/heh/scripts && python3 install.py && rm -rf /tmp/heh"

# Initialize font db
RUN su vscode -c "lualatex --draftmode --interaction=nonstopmode --output-directory=/tmp '\documentclass{article}\begin{document}Hello, world!\end{document}'"

ENTRYPOINT ["/usr/bin/zsh"]
