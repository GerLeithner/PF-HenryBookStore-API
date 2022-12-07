const express = require("express");
const { Book } = require("../db");
const { getApiBooks } = require("../controller/book_controller");


const router = express();
router.use(express.json());

router.get("/", async(req, res) => {
    
    try {
        let books = await getApiBooks();

        res.status(200).json(books);
    }
    catch(e) {
        console.log(e);
        res.status(400).send(e.message);
    }
})

module.exports = router
 