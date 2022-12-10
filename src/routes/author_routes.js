const express = require("express");
const {getAuthor} = require("../controller/author_controller")


const router = express();
router.use(express.json());

router.get("/",async(req,res) =>{
    try {
        let author = await getAuthor();
        res.status(200).json(author)
    } catch (error) {
        console.log(error);
        res.status(400).send(error.message)
    }
})


module.exports = router