FROM froland/devcontainer-java-nodejs:latest
RUN su vscode -c "umask 0002 \
  && . ${SDKMAN_DIR}/bin/sdkman-init.sh \
  && sdk install springboot \
  && sdk flush archives \
  && sdk flush temp \
  && cd /tmp \
  && spring init --artifact-id=sprinboot --build=maven --dependencies=data-jpa,devtools,h2,thymeleaf,web --group-id=be.eafcuccle --name=springboot springboot"
COPY pom.xml /tmp/springboot/pom.xml
RUN su vscode -c "umask 0002 \
  && cd /tmp/springboot \
  && mvn dependency:go-offline dependency:sources package clean \
  && cd /tmp \
  && rm -rf springboot"
RUN su vscode -c "umask 0002 \
  && cd /tmp \
  && npm -y create vite@latest react -- --template react"
COPY package.json /tmp/react/package.json
RUN su vscode -c "umask 0002 \
  && cd /tmp/react \
  && npm install \
  && cd /tmp \
  && rm -rf react"
