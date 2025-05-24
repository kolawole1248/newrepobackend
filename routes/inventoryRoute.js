// Needed Resources 
const express = require("express")
const router = new express.Router() 
const invController = require("../controllers/invController")

// Route to build inventory by classification view
router.get("/type/:classificationId", invController.buildByClassificationId);

module.exports = router;

router.get("/detail/:inv_id", invController.buildByInventoryId);

router.get("/trigger-error", (req, res, next) => {
    next(new Error("Intentional 500 Error"));
  });