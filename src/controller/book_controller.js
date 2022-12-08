const fetch = require("node-fetch");
const { Book, Genre, Author } = require("../db.js");
const { API_KEY } = process.env;
const  authors = require("../controller/author_controller");


async function getApiBooks() {
    let BooksPromises = authors.map(async author => {
        let bookPromise = await fetch(`https://www.googleapis.com/books/v1/volumes?q=inauthor:"${author}"keyes&key=${API_KEY}&maxResults=2`);
        let jsonBook = await bookPromise.json(); 
        console.log(jsonBook);
        return jsonBook.items;    
    });

    let apiBooks = await Promise.all(BooksPromises);
    return apiBooks;

    
}

async function getDbBooks() {
    let dbBooks = await Book.findAll({
        include: [
            {
                model: Genre,
                atributes: ["name"],
                though: {
                    raw: true,
                    attributes: []
                }
            },
            {
                model: Author,
                atributes: ["name"],
                though: {
                    raw: true,
                    atributes: []
                }
            }
        ]
    });

    return dbBooks;
}



module.exports = {
    getApiBooks,
    getDbBooks,
}