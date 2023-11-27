const express = require('express');
const body_parser = require('body-parser');
const userRouter = require('./routers/user.routers');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(body_parser.json());

app.use('/api', userRouter);

module.exports = app;