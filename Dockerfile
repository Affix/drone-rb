FROM ruby:2.5.1-alpine
MAINTAINER Keiran Smith <opensource@keiran.scot>

ENV BUILD_PACKAGES curl-dev build-base bash
ENV RUBY_PACKAGES cairo-dev tzdata wget
ENV WKHTMLTOPDF_PACKAGES gtk+ glib ttf-freefont fontconfig dbus

RUN apk add --no-cache \
    $BUILD_PACKAGES \
    $RUBY_PACKAGES \
    $WKHTMLTOPDF_PACKAGES \
    git \
    imagemagick \
    less \
    nodejs \
    nodejs-npm \
    openssh

RUN wget --no-check-certificate https://github.com/kernix/wkhtmltopdf-docker-alpine/raw/master/wkhtmltopdf -P /usr/bin/
RUN chmod a+x /usr/bin/wkhtmltopdf

ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

RUN gem install bundler --no-ri --no-rdoc
RUN npm install -g yarn
