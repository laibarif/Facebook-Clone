const mongoose = require('mongoose');
//const bcrypt = require('bcrypt');
const db = require('../config/db');

const { Schema } = mongoose;

const userSchema = new Schema({
    name:{
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    }
});

userSchema.methods.comparePassword = async function(userPassword){
    try {
        const isMatch = await check(userPassword, this.password);
        return isMatch;
    } catch (error) {
        throw error;
    }
}
async function check(userPassword, password){
    if(userPassword == password)
    {
        return true;
    }
    else
    {
        return false;
    }
}

const UserModel = db.model('user', userSchema);

module.exports = UserModel;
