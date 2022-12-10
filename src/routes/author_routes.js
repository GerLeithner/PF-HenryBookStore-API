const express = require("express");
const { getDbAuthors, createDbAuthors } = require("../controller/author_controller");

const router = express();
router.use(express.json());

// debería fijarse la la db ya está llena, para no volver a crear todo de vuelta
// para eso hizo falta usar el bulkCreate y para eso pasar los authors a Json
// sino no respeta el await (mismo error book, diets, pokemons, etc)
router.get("/", async(req, res) => {
    try {
        let authors = await getDbAuthors();

        if(!authors.length) {
            authors = await createDbAuthors();
        }

        res.status(200).json(authors)
    } catch (error) {
        console.log(error);
        res.status(400).send(error.message)
    }
})


module.exports = router