const express = require('express');
const mysql = require('mysql2');
const multer = require('multer');
const bodyParser = require('body-parser');
const session = require('express-session');

const app = express();

// Create MySQL connection
const connection = mysql.createConnection({
  // host: 'localhost',
  // user: 'root',
  // password: '',
  // database: 'c237_idweb',
  // port: 3316
  host:'mysql-serjia.alwaysdata.net',
  user:'serjia',
  password:'4GYHW7H8J8jycY.',
  database:'serjia_idweb',
  port: 3306
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

// Set up view engine
app.set('view engine', 'ejs');

// Enable static files
app.use(express.static('public'));

// Enable form processing
app.use(express.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Session setup
app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true
}));

// Uploading image to server
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/images');
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  }
});

const upload = multer({ storage });

//function to check if user is logged in
function requireLogin(req, res, next) {
  if (req.session && req.session.login) {
    return next(); // User is approve, so continue to the next function
  } else {
    res.redirect('/login'); // Redirect to login page if not logged in
  }
}

// Routes

// Get Index Page
app.get('/', (req, res) => {
  res.render('index');
});

// Service Page
app.get('/service', (req, res) => {
  const sql = 'SELECT * FROM service';
  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send('Error retrieving services');
    }
    res.render('service', { service: results });
  });
});

// Quote Page
app.get('/quote', (req, res) => {
  res.render('quote');
});

// Submitting Form
app.post('/quote', upload.single('floorplan'), (req, res) => {
  const { name, email, contact, housetype, design, service } = req.body;
  let floorplan;
  if (req.file) {
    floorplan = req.file.filename;
  } else {
    floorplan = null;
  }
  const sql = 'INSERT INTO contact (name, email, contact, housetype, floorplan, design, service) VALUES (?, ?, ?, ?, ?, ?, ?)';

  connection.query(sql, [name, email, contact, housetype, floorplan, design, service], (error, results) => {
    if (error) {
      console.error("Error adding quote:", error);
      res.status(500).send('Error adding quote');
    } else {
      res.redirect('/');
    }
  });
});

// Designs Page
app.get('/designs', (req, res) => {
  const sql = 'SELECT * FROM design';
  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send('Error retrieving designs');
    }
    res.render('designs', { designs: results });
  });
});

// Product Page
app.get('/product', (req, res) => {
  const sql = 'SELECT * FROM furniture';
  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send('Error retrieving furniture');
    }
    res.render('product', { furniture: results });
  });
});

// Product ID Page
app.get('/product/:id', upload.single('image'), (req, res) => {
  const furnitureId = req.params.id;
  let image;
  if (req.file) {
    image = req.file.filename;
  } else {
    image = null;
  }

  const sql = 'SELECT * FROM furniture WHERE furnitureId = ?';
  connection.query(sql, [furnitureId], (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send('Error retrieving furniture by ID');
    }
    if (results.length > 0) {
      res.render('productid', { furniture: results[0] });
    } else {
      res.status(404).send('Furniture Not Found');
    }
  });
});

// Adding furniture into cart
app.post("/addcart/:id", requireLogin, (req, res) => {
  const furnitureId = req.params.id;
  const { quantity, price, name, image } = req.body;
  const userId = req.session.email; // catch userId (email) from session

  const sql = 'INSERT INTO cart (userId, furnitureId, quantity, price, name, image) VALUES (?, ?, ?, ?, ?, ?)';
  connection.query(sql, [userId, furnitureId, quantity, price, name, image], (err, result) => {
    if (err) {
      console.error('Error adding to cart:', err);
      res.status(500).send('Error adding to cart');
    } else {
      res.redirect('/cart');
    }
  });
});



// Cart Page
app.get('/cart', requireLogin, (req, res) => {
  const userId = req.session.email; 
  const sql = 'SELECT * FROM cart WHERE userId = ?';
  connection.query(sql, [userId], (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send('Error retrieving cart');
    }
    res.render('cart', { cart: results });
  });
});

// Edit quantity page
app.get('/edit/:id', requireLogin, (req, res) => {
  const orderId = req.params.id;
  const sql = 'SELECT orderId, quantity FROM cart WHERE orderId = ?';
  connection.query(sql, [orderId], (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send('Error retrieving cart by ID');
    }
    if (results.length > 0) {
      res.render('edit', { cart: results[0] });
    } else {
      res.status(404).send('Item not found in cart');
    }
  });
});

// Edit quantity
app.post('/edit/:id', requireLogin, (req, res) => {
  const orderId = req.params.id;
  const { quantity } = req.body;
  const sql = 'UPDATE cart SET quantity = ? WHERE orderId = ?';
  connection.query(sql, [quantity, orderId], (error, results) => {
    if (error) {
      console.error('Database update error:', error.message);
      return res.status(500).send('Error updating quantity');
    }
    res.redirect('/cart');
  });
});

// Deleting furniture in the cart
app.get('/delete/:id', requireLogin, (req, res) => {
  const orderId = req.params.id;
  const sql = 'DELETE FROM cart WHERE orderId = ?';
  connection.query(sql, [orderId], (error, results) => {
    if (error) {
      console.error('Error deleting item from cart:', error);
      res.status(500).send('Error deleting item from cart');
    } else {
      res.redirect('/cart');
    }
  });
});

// Portfolio Page
app.get('/portfolio', (req, res) => {
  const sql = 'SELECT * FROM portfolio';
  connection.query(sql, (error, results) => {
    if (error) {
      console.error('Database query error:', error.message);
      return res.status(500).send('Error retrieving portfolio');
    }
    res.render('portfolio', { portfolio: results });
  });
});

// Contact Page
app.get('/contact', (req, res) => {
  res.render('enquiries'); 
});

// Submit enquiries form
app.post('/contact', upload.single('image'), (req, res) => {
  const { name, type, description, orderId } = req.body;
  let image;
  if (req.file) {
    image = req.file.filename;
  } else {
    image = null;
  }
  const date = new Date(); 

  const sql = 'INSERT INTO enquires (name, description, type, orderId, image, date) VALUES (?, ?, ?, ?, ?, ?)';

  connection.query(sql, [name, description, type, orderId, image, date], (error, results) => {
    if (error) {
      console.error("Error adding enquiry:", error);
      res.status(500).send('Error adding enquiry');
    } else {
      res.redirect('/');
    }
  });
});

// Login/Sign up page
app.get('/login', (req, res) => {
  res.render('login');
});

app.get('/signup', (req, res) => {
  res.render('signup');
});

app.post('/login', (req, res) => {
  const email = req.body.email;
  const password = req.body.password;
  const sql = 'SELECT * FROM user WHERE email = ? AND password = ?';

  connection.query(sql, [email, password], (err, result) => {
    if (err) {
      res.send('Error with query');
    } else if (result.length > 0) {
      req.session.login = true;
      req.session.email = email;
      res.redirect('/cart');
    } else {
      res.send('Incorrect Email and/or Password.');
    }
  });
});

app.post('/signup', (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  if (email && password) {
    const sql = 'INSERT INTO user (email, password) VALUES (?, ?)';

    connection.query(sql, [email, password], (err, result, fields) => {
      if (err) {
        res.send('Error creating user.');
        return;
      } else {
        res.redirect('/cart');
        return;
      }
    });
  } else {
    res.send('Please enter email and password');
    return; 
  }
});

// Logout
app.get('/logout', (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.error(err);
    }
    res.redirect('/product');
  });
});


// Checkout Page
app.get('/checkout', requireLogin, (req, res) => {
  res.render('checkout');
});

// Submitting Checkout Form
app.post('/checkout', requireLogin, (req, res) => {
  const { name, email, address, phone, postalcode, unit, area } = req.body;
  const userId = req.session.email;

  const sql = 'INSERT INTO delivery (userId, postalcode, address, area, unit) VALUES (?, ?, ?, ?, ?)';
  connection.query(sql, [userId, postalcode, address, area, unit], (error, results) => {
    if (error) {
      console.error("Error adding order:", error);
      res.status(500).send('Error adding order');
    } else {

      // Clear the session after order is successfully added
      req.session.destroy((err) => {
        if (err) {
          console.error("Error destroying session:", err);
          res.status(500).send('Error logging out');
        } else {
          res.send('Order successfully added. Logged out.');
        }
      });
    }
  });
});



const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}/`);
});
