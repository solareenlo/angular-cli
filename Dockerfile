FROM node:10.16.3-alpine

RUN apk update \
  && npm install -g @angular/cli@8.3.12 \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clear --force \
  && yarn cache clean \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

WORKDIR /app
