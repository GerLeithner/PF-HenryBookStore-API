const fetch = require("node-fetch");
const { Book } = require("../db.js");
const { API_KEY } = process.env;
const  authors = require("../controller/author_controller");


async function getApiBooks() {
    let BooksPromises = authors.map(async author => {
        let bookPromise = await fetch(`https://www.googleapis.com/books/v1/volumes?q=inauthor:"${author}"keyes`)
        return await bookPromise.json();     
    });

    let books = await Promise.all(BooksPromises);
    console.log(books);
    return books;
}

module.exports = {
    getApiBooks
}