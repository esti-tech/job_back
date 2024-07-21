const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2/promise');
const cors = require('cors');
const multer = require('multer')
const app = express();
const port = 5000;

// MySQL connection configuration
const connection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'peeddb',
});


// Middleware
app.use(cors());
app.use(bodyParser.json());

// Route to post a job
app.post('/api/register/job', async (req, res) => {
    try {
        const { position, location, department, reportsTo, jobDescription, keyResponsibilities, qualifications, applicationDeadline, salary } = req.body;
        const [result] = await connection.query('INSERT INTO job_vacancies (position, location, department, reportsTo, jobDescription, keyResponsibilities, qualifications, applicationDeadline, salary) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', [position, location, department, reportsTo, jobDescription, keyResponsibilities, qualifications, applicationDeadline, salary]);
        res.status(201).send({ id: result.insertId, ...req.body });
    } catch (error) {
        res.status(400).send(error);
    }
});

// Route to register a user
app.post('/api/register/user', async (req, res) => {
    try {
        const { name, phone, email, password } = req.body;
        const [result] = await connection.query('INSERT INTO users SET ?', { name, phone, email, password });
        res.status(201).send({ id: result.insertId, ...req.body });
    } catch (error) {
        res.status(400).send(error);
    }
});


// Route to get all jobs
app.get('/api/jobs', async (req, res) => {
    try {
        const [results] = await connection.query('SELECT * FROM job_vacancies');
        res.send(results);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Route to get a single job by ID
app.get('/api/jobs/:id', async (req, res) => {
    try {
        const [result] = await connection.query('SELECT * FROM job_vacancies WHERE id = ?', [req.params.id]);
        if (result.length === 0) {
            return res.status(404).send({ message: 'Job not found' });
        }
        res.send(result[0]);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Route to get all users
app.get('/api/users', async (req, res) => {
    try {
        const [results] = await connection.query('SELECT * FROM users');
        res.send(results);
    } catch (error) {
        res.status(500).send(error);
    }
});

// Route to get a single user by ID
app.get('/api/users/:id', async (req, res) => {
    try {
        const [result] = await connection.query('SELECT * FROM users WHERE id = ?', [req.params.id]);
        if (result.length === 0) {
            return res.status(404).send({ message: 'User not found' });
        }
        res.send(result[0]);
    } catch (error) {
        res.status(500).send(error);
    }
});



app.post('/save', async (req, res) => {
    try {
      const { title, description, fields } = req.body;
      await db.query('INSERT INTO forms (title, description, fields) VALUES (?, ?, ?)', [title, description, JSON.stringify(fields)]);
      res.status(200).send('Form saved successfully');
    } catch (error) {
      res.status(500).send('Error saving form');
    }
  });

  app.post('/save-theme', async (req, res) => {
    try {
      const { primaryColor, secondaryColor, accentColor } = req.body;
      await db.query('INSERT INTO themes (primaryColor, secondaryColor, accentColor) VALUES (?, ?, ?)', [primaryColor, secondaryColor, accentColor]);
      res.status(200).send('Theme saved successfully');
    } catch (error) {
      res.status(500).send('Error saving theme');
    }
  });

// Set up storage for logo uploads
    const storage = multer.diskStorage({
        destination: (req, file, cb) => {
          cb(null, 'uploads/');
        },
        filename: (req, file, cb) => {
          cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
        }
      });
      const upload = multer({ storage: storage });
      app.post('/upload-logo', upload.single('logo'), (req, res) => {
        if (req.file) {
          res.status(200).send(`Logo uploaded successfully: ${req.file.path}`);
        } else {
          res.status(400).send('No file uploaded');
        }
      });
// Start server
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});