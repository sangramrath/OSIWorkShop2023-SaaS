# pull official base image
FROM node:16-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
#ENV NODE_ENV DEV
#ENV NODE_OPTIONS --openssl-legacy-provider

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install
#RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# start app
CMD ["npm", "start"]
