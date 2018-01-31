const express = require('express');

const app = express();
app.use(express.static('frontend/dist'));

module.exports = app;
