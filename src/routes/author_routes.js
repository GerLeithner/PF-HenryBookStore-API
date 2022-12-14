const express = require("express");
const {
  getAuthors,
  getDbAuthors,
  getAuthorIdByName,
  getAuthorByName,
} = require("../controller/author_controller");

const router = express();
router.use(express.json());

let filledDb = false;

router.get("/", async (req, res) => {
  let { name } = req.query;
  let author;
  try {
    if (!name) {
      if (!filledDb) {
        author = await getAuthors();
        filledDb = true;
      } else {
        author = await getDbAuthors();
      }
    } else {
      author = await getAuthorByName(name);
    }
    res.status(200).json(author);
  } catch (error) {
    console.log(error);
    res.status(400).send(error.message);
  }
});

module.exports = router;
