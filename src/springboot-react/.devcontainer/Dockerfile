FROM froland/devcontainer-java-nodejs:latest AS cache_builder
RUN su vscode -c "umask 0002 \
  && . ${SDKMAN_DIR}/bin/sdkman-init.sh \
  && sdk install springboot \
  && sdk flush archives \
  && sdk flush temp \
  && cd /tmp \
  && spring init --artifact-id=sprinboot --build=maven --dependencies=actuator,data-jpa,data-rest,devtools,flyway,h2,lombok,thymeleaf,web --group-id=be.eafcuccle --name=springboot springboot \
  && cd /tmp \
  && npm create vite@latest react -- --template react-swc"
COPY pom.xml /tmp/springboot/pom.xml
COPY package.json /tmp/react/package.json
RUN su vscode -c "umask 0002 \
  && cd /tmp/springboot \
  && mvn --batch-mode dependency:go-offline dependency:sources package \
  && cd /tmp/react \
  && npm install \
  && cd /tmp \
  && rm -rf springboot react"
