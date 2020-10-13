#Building Scraper
FROM alpine:latest AS tiktok_scraper.build

WORKDIR /usr/app

RUN apk update && apk add --update nodejs nodejs-npm python3 git

COPY package*.json tsconfig.json .prettierrc.js bin ./
COPY ./.git ./.git
COPY ./src ./src

RUN npm i
RUN npm run docker:build
RUN rm -rf src node_modules
