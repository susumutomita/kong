FROM alpine:latest

COPY . /var/app/current
WORKDIR /var/app/current
RUN apk update && apk --update add \
  bash \
  lua \
  lua5.1-dev \
  wget \
  make \
  autoconf \
  gcc \
  musl-dev \
  openssl-dev \
  git \
  gzip \
  zlib \
  pcre-dev curl

RUN wget https://luarocks.org/releases/luarocks-2.4.4.tar.gz && \
    tar zxpf luarocks-2.4.4.tar.gz && \
    cd luarocks-2.4.4 && \
    ./configure && \
    make bootstrap && \
    luarocks install lapis
