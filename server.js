/* ******************************************
 * This server.js file is the primary file of the 
 * application. It is used to control the project.
 *******************************************/
/* ***********************
 * Require Statements
 *************************/
const inventoryRoute = require('./routes/inventoryRoute'); // Adjust path as needed
const express = require("express")
const expressLayouts = require("express-ejs-layouts")
const env = require("dotenv").config()
const app = express()
const static = require("./routes/static")
const baseController = require("./controllers/baseController")

/* ***********************
 * Routes
 *************************/
// Inventory routes
app.use("/inv", inventoryRoute)
app.set("view engine", "ejs")
app.use(expressLayouts)
app.set("layout", "./layouts/layout") // not at views root



app.use(static)

// Index route
app.get("/", (req, res) => {
  res.render("index", { title: "Home" })
})
app.get("/", baseController.buildHome);
/* ***********************
 * Local Server Information
 * Values from .env (environment) file
 *************************/
const port = process.env.PORT
const host = process.env.HOST

/* ***********************
 * Log statement to confirm server operation
 *************************/
app.listen(port, () => {
  console.log(`app listening on ${host}:${port}`)
})




// Example in Express route (server.js)
app.get("/", (req, res) => {
  res.render("your-view", { 
    nav: "<ul><li>Home</li><li>About</li></ul>" // Example navigation HTML
  });
});