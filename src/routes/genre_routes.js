const express = require("express");
const { getApiGenre } = require("../controller/genre_controller");
const Genre = require("../models/Genre");

const router = express();
router.use(express.json());

router.get("/", async(req,res) => {
   try {

    let genre = await getApiGenre();
    res.status(200).json(genre)


   } catch (error) {
    console.log(error);
    res.status(400).send(error.message)
   }
})

module.exports = router