# syntax=docker/dockerfile:1.7

FROM node:20-slim

ENV PNPM_HOME=/pnpm \
    PNPM_STORE_PATH=/pnpm-store \
    PATH=/pnpm:$PATH \
    NODE_ENV=development

ARG PNPM_VERSION=10.5.0
ARG BUF_VERSION=1.45.0
ARG TSX_VERSION=4.20.5

RUN corepack enable \
 && corepack prepare pnpm@${PNPM_VERSION} --activate

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      git \
      bash \
      curl \
      openssh-client \
      ca-certificates \
      openssl \
      inotify-tools \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sSL "https://github.com/bufbuild/buf/releases/download/v${BUF_VERSION}/buf-Linux-$(uname -m)" \
      -o /usr/local/bin/buf \
 && chmod +x /usr/local/bin/buf

RUN npm install --global tsx@^${TSX_VERSION} \
 && npm cache clean --force

WORKDIR /opt/app

RUN mkdir -p /pnpm /pnpm-store \
 && chown -R node:node /opt/app /pnpm /pnpm-store

USER node

CMD ["sleep", "infinity"]
