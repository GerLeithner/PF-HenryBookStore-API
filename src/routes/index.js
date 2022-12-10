const { Router } = require("express");
const bookRoutes = require("./book_routes");
const userRoutes = require("./user_routes");
const genreRoutes = require("./genre_routes")
const authorRoutes = require("./author_routes")

const router = Router();

router.use("/books", bookRoutes);
router.use("/user", userRoutes);
router.use("/genres", genreRoutes)
router.use("/authors", authorRoutes)

module.exports = router;
