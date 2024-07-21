const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    name: { type: String, required: true },
    phone: { type: String },
    email: { type: String },
    password: { type: String, required: true },
});

module.exports = mongoose.model('User', userSchema);