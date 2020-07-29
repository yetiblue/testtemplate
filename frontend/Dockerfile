FROM node:latest

WORKDIR /frontend

RUN npm install -g @vue/cli
COPY . .
RUN npm install

RUN mkdir -p /deps
RUN cp -R node_modules /deps/node_modules
