FROM mhart/alpine-node:10.15

# Create directories all the way up to app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json yarn.lock /usr/src/app/
RUN yarn

# Bundle app source
COPY . /usr/src/app

# force production when built from Docker
ENV NODE_ENV production

# build
RUN yarn build
EXPOSE 3000

CMD [ "node", "server.js" ]
