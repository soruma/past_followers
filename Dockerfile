FROM ruby:2.7.1-alpine

RUN mkdir -p /usr/local/src/myapp

WORKDIR /usr/local/src/myapp

RUN apk upgrade --no-cache \
 && apk add --no-cache \
        build-base \
        sqlite-dev

RUN gem install bundler:2.1.4
