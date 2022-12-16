const express = require("express");
const {
  getApiGenre,
  getGenreByName,
  getDbGenres,
  getGenreIdByName,
} = require("../controller/genre_controller");
const Genre = require("../models/Genre");

const router = express();
router.use(express.json());

let filledDb = false;

router.get("/", async (req, res) => {
  let { name } = req.params;
  let genre;
  try {
    if (!name) {
      if (!filledDb) {
        genre = await getApiGenre();
        filledDb = true;
      } else {
        genre = await getDbGenres();
      }
    } else {
      genre = await getGenreByName(name);
    }
    res.status(200).json(genre);
  } catch (error) {
    console.log(error);
    res.status(400).send(error.message);
  }
});

module.exports = router;
