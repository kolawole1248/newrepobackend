// Error handling
app.use(async (err, req, res, next) => {
    let nav = await utilities.getNav();
    console.error(`Error at: "${req.originalUrl}": ${err.message}`);
    
    if (err.status == 404) {
      res.status(404).render("errors/error", {
        title: "404 Not Found",
        message: err.message,
        nav
      });
    } else {
      res.status(500).render("errors/error", {
        title: "Server Error",
        message: "Something went wrong. Please try again later.",
        nav
      });
    }
  });