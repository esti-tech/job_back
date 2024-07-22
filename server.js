const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2/promise');
const cors = require('cors');
const multer = require('multer')
const path = require('path');
const app = express();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const fs = require('fs');
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
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));


const secretKey = 'eplusapp8'; // Change this to a secure secret key


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
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
      cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
  });
// Define the file filter to accept only PDF files
const fileFilter = (req, file, cb) => {
    const allowedMimeTypes = ['application/pdf'];
    if (allowedMimeTypes.includes(file.mimetype)) {
        cb(null, true);
    } else {
        cb(new Error('Invalid file type. Only PDF is allowed.'), false);
    }
};

const upload = multer({ storage: storage, fileFilter: fileFilter });

// Route to register a user
// Modify the /api/register/user route to accept file uploads
app.post('/api/register/user', upload.single('file'), async (req, res) => {
    try {
        const { name, phone, email, password,jobid } = req.body;
        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // If a file is uploaded, save the file path in the database
        let filePath = null;
        if (req.file) {
            filePath = req.file.path;
        }

        const [result] = await connection.query('INSERT INTO users (name, phone, email, password, filePath,jobid) VALUES (?, ?, ?, ?, ?,?)', [name, phone, email, hashedPassword, filePath,jobid]);
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
        const [users] = await connection.query('SELECT * FROM users');
        
        const usersWithFileURLs = users.map((user) => {
            if (user.filePath) {
                user.fileURL = `${req.protocol}://${req.get('host')}/uploads/${path.basename(user.filePath)}`;
            } else {
                user.fileURL = null;
            }
            return user;
        });

        res.json(usersWithFileURLs);
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

app.post('/api/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        adminEmail = 'peep@eplusapp.et';
        // to keep others from accessing the site for now we could restrict it just for one person like user 
        //email = peep@eplusapp.et, though it is not nessary to keep it here
        // password = 789264
        // const [result] = await connection.query('SELECT * FROM users WHERE email = ?', [email]);
        const [result] = await connection.query('SELECT * FROM users WHERE email = ?', [adminEmail]);
        if (result.length === 0) {
            return res.status(401).send({ message: 'Invalid email or password' });
        }
        // Compare the provided password with the stored hashed password
        const isMatch = await bcrypt.compare(password, result[0].password);
        if (isMatch) {
            // If the passwords match, generate a token and return the user object without the password
            const token = jwt.sign({ id: result[0].id }, secretKey, { expiresIn: '1h' });
            const { password, ...user } = result[0];
            res.send({ user, token });
        } else {
            res.status(401).send({ message: 'Invalid email or password' });
        }
    } catch (error) {
        res.status(500).send(error);
    }
});

const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    if (token == null) return res.sendStatus(401);

    jwt.verify(token, secretKey, (err, user) => {
        if (err) return res.sendStatus(403);
        req.user = user;
        next();
    });
};

// Example protected route
app.get('/api/protected', authenticateToken, (req, res) => {
    res.send('This is a protected route');
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