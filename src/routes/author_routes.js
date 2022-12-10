const express = require("express");
const { getAuthors } = require("../controller/author_controller");

const router = express();
router.use(express.json());

router.get("/",async(req,res) =>{
    try {
        let author = await getAuthors();
        res.status(200).json(author)
    } catch (error) {
        console.log(error);
        res.status(400).send(error.message)
    }
})

module.exports = router