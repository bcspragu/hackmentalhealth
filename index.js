const path = require('path');
const dotenv = require('dotenv').config({
  path: process.env.NODE_ENV === 'production' ? path.resolve(__dirname, 'prod.env') : path.resolve(__dirname, 'dev.env')
});

const port = process.env.PORT || 8080;
const server = require('./backend')
const app = require('./backend/express');
const socket = require('./backend/websocket');

server.on('request', app);

// This lets us exit from our test Docker container easily.
process.on('SIGINT', function() { console.log('Caught Ctrl+C...'); process.exit(); });

server.listen(port, () => {
  console.info(`server/ws started on port ${port}`);
});
