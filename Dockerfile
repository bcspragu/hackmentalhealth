FROM node:alpine
VOLUME /project
WORKDIR /project
RUN apk update && apk add yarn
CMD ["npm", "run", "start"]
