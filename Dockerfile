FROM node:17-alpine

WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY package.json package-lock.json /usr/src/app/
RUN npm ci --production

COPY . /usr/src/app

EXPOSE 3000
CMD [ "npm", "start" ]
