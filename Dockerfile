FROM node:12.13.1-alpine3.10

RUN apk update \
  && npm install -g @angular/cli@8.3.20 \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clear --force \
  && yarn cache clean \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

WORKDIR /app
