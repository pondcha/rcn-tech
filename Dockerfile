# Load the Docker image.
FROM node:20-alpine3.16

# Define environment variables.
ENV LANG C.UTF-8
ENV PS1 '▷ '
ENV APP_ROOT /rcn-tech
ENV NODE_OPTIONS --openssl-legacy-provider

# Install Packages.
RUN apk update && apk upgrade && apk add --update --no-cache \
    util-linux \
    g++ \
    make \
    bash \
    zlib-dev \
    libpng-dev \
    vips-dev \
    git \
    python3 && ln -sf python3 /usr/bin/python

# Install Gridsome CLI.
RUN yarn global add @gridsome/cli

# Set up a work directory.
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# Install Yarns
COPY package.json .
COPY yarn.lock .
RUN yarn && yarn build

# Copy the source code.
ADD . $APP_ROOT
