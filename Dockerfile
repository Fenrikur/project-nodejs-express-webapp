# Lets see how our little app does with the latest versions of nearly everything
FROM node:latest

WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

RUN npm i -g npm-check-updates

COPY package.json package-lock.json /usr/src/app/
# Check for and print current vulns before updating everything to latest
RUN npm audit; ncu -u; npm update

COPY . /usr/src/app

EXPOSE 3000
CMD [ "npm", "start" ]
