const { Router } = require('express');
const bookRoutes = require("./book_routes");
const genreRoutes = require("./genre_routes")

const router = Router();

router.use("/books", bookRoutes);
router.use("/genres", genreRoutes)


module.exports = router;