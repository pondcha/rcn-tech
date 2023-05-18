# Load the Docker image.
FROM node:20-alpine3.16

# Define environment variables.
ENV LANG C.UTF-8
ENV PS1 '▷ '

# Install Packages.
RUN apk update && apk upgrade && apk add --update --no-cache git

# Install Gridsome CLI.
RUN yarn global add @gridsome/cli

# Set up a work directory.
WORKDIR /rcn-tech
