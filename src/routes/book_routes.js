const express = require("express");
const { 
createDbBooks,
getDbBooks,
getBooksBytitle,
getBookById,
getTrendingsBooks,
validateId,
validatePost } = require("../controller/book_controller");
const { Book } = require("../db.js");


const router = express();
router.use(express.json());

// author id = 5a491c43-463a-4435-9fa6-bd85112525b3
// genre id = f91199a2-5650-438b-b4ec-ae5872aef461

// {
//     "title": "Nuevo Libro",
//     "publishedDate": "2022",
//     "publisher": "Ejemplo Editor",
//     "description": "Ejemplo descripcion",
//     "pages": 100,
//     "averageRating": 4,
//     "usersRating": null,
//     "cover": "url Cover",
//     "identifier": "ISB:de ejemplo",
//     "authors": [ "5a491c43-463a-4435-9fa6-bd85112525b3" ],
//     "genres": [ "f91199a2-5650-438b-b4ec-ae5872aef461" ]
// }

router.post("/", async(req, res) => {
    try {
        validatePost(req.body);

        let { authorsId, genresId, title } = req.body;

        let newBook = await Book.create(req.body);
        if(!newBook) {
            throw new Error("no se pudo crear el libro")
        }

        newBook.setGenres(genresId);
        newBook.setAuthors(authorsId);

        res.status(200).json(await getBooksBytitle(title));
    }
    catch(e) {
        console.log(e);
        res.status(400).send(e.message);
    }
});

router.get("/", async(req, res) => {
    let { title } = req.query;
    let books = [];
    try {
        if(!title) {
            books = await getDbBooks();

            if(!books.length) {
                books = await createDbBooks();
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

router.get("/trending", async(req, res) => {
    try {
        let topTen = await getTrendingsBooks();
        if(!topTen.length) {
            throw new Error("Error al ordenar los libros");
        }
        res.status(200).json(topTen);
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
 