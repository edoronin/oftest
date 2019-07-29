FROM node:10


RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app
ENV  NODE_ENV production

ADD package.json /usr/src/app/package.json
ADD index.js /usr/src/app/index.js
RUN npm install --production
ENV VERSION="0.0.3"
EXPOSE 8080

ENTRYPOINT ["node", "index.js"]
USER node
