FROM froland/devcontainer-java-nodejs:latest AS cache_builder
RUN su vscode -c "umask 0002 \
  && . ${SDKMAN_DIR}/bin/sdkman-init.sh \
  && sdk install springboot \
  && sdk flush archives \
  && sdk flush temp \
  && cd /tmp \
  && spring init --artifact-id=sprinboot --build=maven --dependencies=data-jpa,devtools,h2,thymeleaf,web --group-id=be.eafcuccle --name=springboot springboot \
  && cd /tmp \
  && corepack enable \
  && corepack prepare pnpm@latest --activate
  && pnpm create vite react --template react"
COPY pom.xml /tmp/springboot/pom.xml
COPY package.json /tmp/react/package.json
RUN su vscode -c "umask 0002 \
  && cd /tmp/springboot \
  && mvn --batch-mode dependency:go-offline dependency:sources package \
  && cd /tmp/react \
  && pnpm install \
  && cd /tmp \
  && rm -rf springboot react"
