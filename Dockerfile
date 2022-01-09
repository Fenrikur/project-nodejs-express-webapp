# Because this project is just THAT old and we all know node.js was actually feature complete and free of bugs at day 1.
FROM node:6.10

WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY package.json package-lock.json /usr/src/app/
# Usually we would do 'npm ci' here, but who needs those modern features right?
RUN npm install --production

COPY . /usr/src/app

EXPOSE 3000
CMD [ "npm", "start" ]
