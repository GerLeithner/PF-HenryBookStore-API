const express = require("express");
const { createDbBooks, getDbBooks } = require("../controller/book_controller");


const router = express();
router.use(express.json());

router.get("/", async(req, res) => {
    let { name } = req.query;

    if(!name) {
        try {
            let books = await getDbBooks();

            if(!books.length) {
                books = await createDbBooks();
            }

            res.status(200).json(books);
        }
        catch(e) {
            console.log(e);
            res.status(400).send(e.message);
        }
    }
    else {
        
    }
})


module.exports = router
 