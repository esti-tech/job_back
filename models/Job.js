const mongoose = require('mongoose');

const jobSchema = new mongoose.Schema({
    position: { type: String, required: true },
    location: { type: String, required: true },
    department: { type: String, required: true },
    reportsTo: { type: String, required: true },
    jobDescription: { type: String, required: true },
    keyResponsibilities: { type: String, required: true },
    qualifications: { type: String, required: true },
    applicationDeadline: { type: Date, required: true },
    salary: { type: String },
});

module.exports = mongoose.model('Job', jobSchema);