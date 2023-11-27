const UserService = require('../services/user.services');
const user = require('../model/user.model');

async function register(req, res) {
  try {
    const successRes = await user.create(req.body);
    res.status(201).json({ status: true, success: "User is Registered Successfully", data: successRes });
  } catch (err) {
    console.error(err);
    res.status(500).json({ status: false, error: "Internal server error" });
  }
}
 

async function login(req, res, next){
    try {
        const {email, password} = req.body;

        const user = await UserService.checkUser(email);

        if(!user){
            throw new Error('User does not exist');
        }

        const isMatch = await user.comparePassword(password);

        if(isMatch === false){
            throw new Error('Invalid Password');
        }

        let tokenData = {_id:user._id, email:user.email, name:user.name};

        const token = await UserService.generateToken(tokenData, "securityKey", "1h");

        res.status(200).json({status:true, token:token});

    } catch (error) {
        throw error;
    }
}
module.exports = {

    register,
    login,
}
