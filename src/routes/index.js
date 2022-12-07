const { Router } = require('express');
const bookRoutes = require("./book_routes");

const router = Router();

router.use("/books", bookRoutes);


module.exports = router;