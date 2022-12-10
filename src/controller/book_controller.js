const fetch = require("node-fetch");
const { Book, Genre, Author } = require("../db.js");
// const { API_KEY } = process.env;
const  authors = require("../controller/author_controller");



async function getApiBooks() {
    let books = [];

    let booksPromises = authors.map(async author => {

        let bookPromise = await fetch(`https://www.googleapis.com/books/v1/volumes?q=inauthor:"${author}"keyes&maxResults=2`);
        let jsonBooks = await bookPromise.json(); 
        return jsonBooks.items;    
    });

    let apiBooksXAuthor = await Promise.all(booksPromises);

    apiBooksXAuthor.map(arrayBooks => arrayBooks.map(book => books.push(normalizeApiBook(book.volumeInfo))));

    let dbBooks = await Book.bulkCreate(books, { ignoreDuplicates: true })

    return dbBooks;
}

function normalizeApiBook(book) {
    return {
        title: book.subtitle ? `${book.title}, ${book.subtitle}` : book.title,
        publishedDate: book.publishedDate ? book.publishedDate : "not specified",
        publisher: book.publisher ? book.publisher : "not specified",
        description: book.description ? book.description : "not specified",
        pages: book.pageCount ? book.pageCount : null,
        averageRating: book.averageRating ? book.averageRating : null,
        cover: book.imageLinks ? book.imageLinks.thumbnail : "img_not_found",
        identifier: 
        book.industryIdentifiers[0].type === "OTHER" ? 
        book.industryIdentifiers[0].identifier : 
        `ISBN:${book.industryIdentifiers[0].identifier}`
    }
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