FROM alpine:3.7

ARG NETLIFYCTL_VERSION=0.4.0

RUN set -x \
  && apk add --no-cache --update --upgrade --virtual .netlifyctl-dependency-packages \
    ca-certificates wget \
  && wget "https://github.com/netlify/netlifyctl/releases/download/v${NETLIFYCTL_VERSION}/netlifyctl-linux-amd64-${NETLIFYCTL_VERSION}.tar.gz" \
  && tar -C /usr/local/bin -xzvf "netlifyctl-linux-amd64-${NETLIFYCTL_VERSION}.tar.gz" \
  && chmod +x /usr/local/bin/netlifyctl \
  && rm -rf "netlifyctl-linux-amd64-${NETLIFYCTL_VERSION}.tar.gz" \
  && apk del .netlifyctl-dependency-packages \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src/app

ENTRYPOINT ["netlifyctl"]

