const app = require('./app');
const db = require('./config/db');
const UserModel = require('./model/user.model');
const route = require('./routers/user.routers');
const port = 3000;


app.listen(port,()=>{
    console.log('Okay');
})