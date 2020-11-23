FROM ruby:2.7.2-alpine

RUN mkdir -p /usr/local/src/myapp

WORKDIR /usr/local/src/myapp

RUN apk upgrade --no-cache \
 && apk add --no-cache \
        build-base \
        nodejs \
        sqlite-dev \
        tzdata

RUN gem install bundler:2.1.4
