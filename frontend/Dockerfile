FROM node:14.8.0-alpine

RUN mkdir -p /usr/local/src/frontend
WORKDIR /usr/local/src/frontend

RUN apk upgrade --no-cache \
 && apk add --no-cache \
        g++ \
        make \
        python \
 && yarn global add @vue/cli
