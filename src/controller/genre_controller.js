const fetch = require("node-fetch");
const { genres } = require("./authors_genres_controller");
const { Genre } = require("../db");

async function getApiGenre() {
  let genrePromises = genres.map(async (genre) => {
    let [dbGenre, created] = await Genre.findOrCreate({
      where: { name: genre },
    });
    return dbGenre;
  });
  let dbGenres = await Promise.all(genrePromises);
  return dbGenres;
}

async function getDbGenres() {
  let genres = await Genre.findAll({});
  return genres;
}
async function getGenreIdByName(name) {
  let genre = await Genre.findOne({
    where: { name },
  });
  return genre.id;
}

async function getGenreByName(name) {
  let genre = await Genre.findOne({
    where: { name },
  });
  return genre;
}

module.exports = {
  getApiGenre,
  getGenreIdByName,
  getGenreByName,
  getDbGenres,
};
