FROM node:12.16.1-alpine3.11

RUN apk update \
  && npm install -g @angular/cli@9.1.0 \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clear --force \
  && yarn cache clean \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

WORKDIR /app
