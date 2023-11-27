const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://127.0.0.1:27017/my_database').on('open', () => {
    console.log("MongoDb connection successful");
}).on('error', () => {
    console.log("MongoDb connection error");
});

module.exports = connection;