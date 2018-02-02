FROM node:alpine
VOLUME /project
WORKDIR /project
RUN apk update && apk add yarn git
ENV HEROKU_CLI_VERSION '6.15.22'
RUN yarn global add heroku-cli@$HEROKU_CLI_VERSION
CMD ["npm", "run", "start"]
