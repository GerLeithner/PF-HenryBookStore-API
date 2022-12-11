const express = require("express");
const { 
createDbBooks,
getDbBooks,
getBooksBytitle,
getBookById,
validateId } = require("../controller/book_controller");


const router = express();
router.use(express.json());

router.get("/", async(req, res) => {
    let { title } = req.query;
    let books = [];
    try {
        if(!title) {
            books = await getDbBooks();
            if(!books.length) {
                books = await createDbBooks();
            }
            if(!books.length) {
                throw new Error("Error en la creación de los libros");
            }
            res.status(200).json(books);
        }
        else {
            books = await getBooksBytitle(title);
            if(!books.length) {
                throw new Error("No existen libros con ese nombre");
            }
            res.status(200).json(books);
        }
    }
    catch(e) {
        console.log(e);
        res.status(400).send(e.message);
    }
});

router.get("/:id", async(req, res) => {
    let { id } = req.params;
    try {   
        validateId(id);
        let book = await getBookById(id);
        if(!book) {
            throw new Error("No se ha encontrado el libro")
        }
        res.status(200).json(book);
    }
    catch(e) {
        console.log(e);
        res.status(400).send(e.message);
    }
});

module.exports = router
 