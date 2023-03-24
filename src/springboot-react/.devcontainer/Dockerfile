FROM froland/devcontainer-java-nodejs:latest AS cache_builder
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
  && mvn --batch-mode dependency:go-offline dependency:sources package"
RUN su vscode -c "umask 0002 \
  && cd /tmp \
  && npm -y create vite@latest react -- --template react"
COPY package.json /tmp/react/package.json
RUN su vscode -c "umask 0002 \
  && cd /tmp/react \
  && npm install"

FROM froland/devcontainer-java-nodejs:latest AS container
COPY --from=cache_builder /home/vscode/.m2 /home/vscode/.npm /home/vscode/
