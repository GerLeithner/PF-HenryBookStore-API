const { Author } = require("../db");
const { authors } = require("./authors_genres_controller");

async function getAuthors() {
  let authorPromises = authors.map(async (author) => {
    let [dbAuthor, created] = await Author.findOrCreate({
      where: { name: author },
    });
    return dbAuthor;
  });
  let dbAuthors = await Promise.all(authorPromises);
  return dbAuthors;
}

async function getDbAuthors() {
  let dbAuthors = await Author.findAll();
  return dbAuthors;
}

async function getAuthorIdByName(name) {
  let author = await Author.findOne({
    where: { name },
  });
  return author.id;
}

async function getAuthorByName(name) {
  let author = await Author.findOne({
    where: { name },
  });
  return author;
}

module.exports = {
  authors,
  getAuthors,
  getDbAuthors,
  getAuthorIdByName,
  getAuthorByName,
};
