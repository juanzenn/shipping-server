FROM node:18-alpine as build-image
WORKDIR /usr/src/app
COPY package*.json ./
COPY tsconfig.json ./
COPY drizzle.config.ts ./
COPY ./src ./src
RUN npm ci
RUN npm run build

FROM node:18-alpine
WORKDIR /usr/src/app
COPY package*.json ./
COPY --from=build-image ./usr/src/app/dist ./dist
RUN npm ci --only=production
COPY . .
EXPOSE 8080
CMD [ "node", "dist/app.js" ]