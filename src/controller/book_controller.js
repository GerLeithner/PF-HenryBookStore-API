const fetch = require("node-fetch");
const { Book, Genre, Author } = require("../db.js");
const { authorsAndGenres } = require("./authors_genres_controller");
const { getAuthorIdByName } = require("../controller/author_controller");
const { getGenreIdByName } = require("./genre_controller");

function validateId(id) {
  const regexId =
    /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/;
  if (!regexId.test(id)) {
    throw new Error("Id invalido para la base de datos");
  }
}

function validatePost({
  title,
  publishedDate,
  publisher,
  authorName,
  genreName,
  averageRating,
}) {
  if (!title) throw new Error("debe ingresar un titulo");
  if (!publishedDate) throw new Error("debe ingresar una fecha de publicación");
  if (!publisher) throw new Error("debe ingresar una editorial");
  if (!authorName) throw new Error("debe ingresar un autor");
  if (!genreName) throw new Error("debe ingresar un género");

  var regexName = /^[a-zA-Z\s]+$/;
  if (!regexName.test(title)) {
    throw new Error("Nombre invalido, no puede contener simbolos, ni numeros");
  }

  let regexAverageRatin = /^\d+$/;
  if (averageRating === "") averageRating = null;
  if (averageRating && !regexAverageRatin.test(averageRating)) {
    throw new Error("el averageRating debe ser un numero");
  }
  if (averageRating < 0 || averageRating > 5) {
    throw new Error("el healthScore debe estar entre 0 y 5");
  }
}

function normalizeApiBook(book, author, genre) {
  return {
    title: book.title,
    subtitle: book.subtitle,
    // falta ajustar la fecha a solo el año !
    publishedDate: book.publishedDate ? (book.publishedDate.includes("-") ? book.publishedDate.split("-")[0] : book.publishedDate)
    : "not specified",
    publisher: book.publisher ? book.publisher : "not specified",
    description: book.description ? book.description : "not specified",
    pages: book.pageCount ? book.pageCount : null,
    averageRating: book.averageRating ? book.averageRating : null,
    cover: book.imageLinks ? book.imageLinks.thumbnail : "img_not_found",
    identifier:
      book.industryIdentifiers[0].type === "OTHER"
        ? book.industryIdentifiers[0].identifier
        : `ISBN:${book.industryIdentifiers[0].identifier}`,
    author, // to find de authors ids and set them
    genre, // to find de genres ids and set them
  };
}

async function createDbBooks() {
  let setApiBooks = new Set();

  let booksPromises = authorsAndGenres.map(async (data) => {
    let bookPromise = await fetch(
      `https://www.googleapis.com/books/v1/volumes?q=inauthor:"${data.author}"keyes&maxResults=2`
    );
    let jsonBooks = await bookPromise.json();
    if (jsonBooks && jsonBooks.items) {
      let filteredBooks = jsonBooks.items.filter(
        (item) =>
          item.volumeInfo.hasOwnProperty("description") &&
          item.volumeInfo.hasOwnProperty("imageLinks") &&
          item.volumeInfo.authors.length &&
          item.volumeInfo.categories &&
          item.volumeInfo.categories.length
      );

      return filteredBooks.map((item) => {
        return normalizeApiBook(item.volumeInfo, data.author, data.genre);
      });
    }
  });
  let apiBooksXAuthor = await Promise.all(booksPromises);
  apiBooksXAuthor.map((arrayBooks) =>
    arrayBooks?.map((book) => setApiBooks.add(book))
  );

  let apiBooks = Array.from(setApiBooks);

  await Book.bulkCreate(apiBooks, { ignoreDuplicates: true });

  let setPromises = apiBooks.map(async (apiBook) => {
    let dbBook = await Book.findOne({
      where: {
        title: apiBook.title,
        identifier: apiBook.identifier,
      },
    });

    let authorId = await getAuthorIdByName(apiBook.author);
    let genreId = await getGenreIdByName(apiBook.genre);

    if (dbBook) {
      authorId && (await dbBook.setAuthor(authorId));
      genreId && (await dbBook.setGenre(genreId));
    }
  });

  await Promise.all(setPromises);

  return await getDbBooks();
}

async function getDbBooks() {
  let books = await Book.findAll({
    include: [Author, Genre],
  });
  return books;
}

async function getBookById(id) {
  let books = await Book.findByPk(id, {
    include: [Author, Genre],
  });
  return books;
}

async function getBooksBytitle(title) {
  let books = await getDbBooks();

  return books.filter((book) =>
    book.title.toLowerCase().includes(title.toLowerCase())
  );
}

async function getTrendingsBooks() {
  let books = await getDbBooks();
  const topTen = [];

  const sortedbyAverageRating = books.sort(function (a, b) {
    if (b.averageRating > a.averageRating) {
      return 1;
    }
    if (a.averageRating > b.averageRating) {
      return -1;
    }
    return 0;
  });

  for (let i = 0; i < 10; i++) {
    topTen.push(sortedbyAverageRating[i]);
  }

  return topTen;
}

async function getNewBooks() {
  let books = await getDbBooks();
  const newsTen = [];

  const sortedbypublishedDate = books.sort(function (a, b) {
    if (b.publishedDate > a.publishedDate) {
      return 1;
    }
    if (a.publishedDate > b.publishedDate) {
      return -1;
    }
    return 0;
  });

  for (let i = 0; i < 10; i++) {
    newsTen.push(sortedbypublishedDate[i]);
  }

  return newsTen;
}

module.exports = {
  createDbBooks,
  getDbBooks,
  getBooksBytitle,
  getBookById,
  getTrendingsBooks,
  getNewBooks,
  validateId,
  validatePost,
};

// async function createDbBooks() {

//     let apiBooks = [];

//     let booksPromises = authors.map(async author => {

//         let bookPromise = await fetch(`https://www.googleapis.com/books/v1/volumes?q=inauthor:"${author}"keyes&maxResults=2`);
//         let jsonBooks = await bookPromise.json();
//         return jsonBooks.items.map(item => {
//             return normalizeApiBook(item.volumeInfo, author);
//         });
//     });
//     let apiBooksXAuthor = await Promise.all(booksPromises);

//     apiBooksXAuthor.map(arrayBooks => arrayBooks.map(book => apiBooks.push(book)));

//     await Book.bulkCreate(apiBooks);

//     let setPromises = apiBooks.map(async apiBook => {
//         let dbBook = await Book.findOne({
//             where: { title: apiBook.title  },
//         });

//         let authorsIds = await Promise.all(apiBook.authors.map(async author => {
//             id = await getAuthorIdByName(author);
//             return id;
//         }));

//         let genresIds = await Promise.all(apiBook.genres.map(async genre => {
//             id = await getGenreIdByName(genre);
//             return id;
//         }));

//         authorsIds && await dbBook.setAuthors( authorsIds );
//         authorsIds && await dbBook.setGenres( genresIds );
//     })

//     await Promise.all(setPromises);

//     return await getDbBooks();
// }
