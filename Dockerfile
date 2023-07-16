FROM node:18-alpine as build-image
WORKDIR /usr/src/app
COPY package*.json ./
COPY tsconfig.json ./
COPY ./src ./src
RUN pnpm ci
RUN pnpm tsc

FROM node:18-alpine
WORKDIR /usr/src/app
COPY package*.json ./
COPY --from=build-image ./usr/src/app/dist ./dist
RUN pnpm i -P
COPY . .
EXPOSE 8080
CMD [ "node", "dist/application.js" ]