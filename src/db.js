require("dotenv").config();
const { Sequelize } = require("sequelize");
const fs = require("fs");
const path = require("path");
const { DB_USER, DB_PASSWORD, DB_HOST, DB_DEPLOY } = process.env;

const sequelize = new Sequelize(
  `postgres://${DB_USER}:${DB_PASSWORD}@${DB_HOST}/books`,
  {
    logging: false, // set to console.log to see the raw SQL queries
    native: false, // lets Sequelize know we can use pg-native for ~30% more speed
  }
);

// const sequelize = new Sequelize(
//   DB_DEPLOY,
//   {
//     logging: false, // set to console.log to see the raw SQL queries
//     native: false, // lets Sequelize know we can use pg-native for ~30% more speed
//   }
// );

const basename = path.basename(__filename);

const modelDefiners = [];

// Leemos todos los archivos de la carpeta Models, los requerimos y agregamos al arreglo modelDefiners
fs.readdirSync(path.join(__dirname, "/models"))
  .filter(
    (file) =>
      file.indexOf(".") !== 0 && file !== basename && file.slice(-3) === ".js"
  )
  .forEach((file) => {
    modelDefiners.push(require(path.join(__dirname, "/models", file)));
  });

// Injectamos la conexion (sequelize) a todos los modelos
modelDefiners.forEach((model) => model(sequelize));
// Capitalizamos los nombres de los modelos ie: product => Product
let entries = Object.entries(sequelize.models);
let capsEntries = entries.map((entry) => [
  entry[0][0].toUpperCase() + entry[0].slice(1),
  entry[1],
]);
sequelize.models = Object.fromEntries(capsEntries);

// En sequelize.models están todos los modelos importados como propiedades
// Para relacionarlos hacemos un destructuring
const { User, Book, Genre, Author, Review, Subscription } = sequelize.models;

Book.belongsTo(Genre, { through: "BookXGenre" });
Genre.belongsToMany(Book, { through: "BookXGenre" });

Book.belongsTo(Author, { through: "BookXAuthor" });
Author.belongsToMany(Book, { through: "BookXAuthor" });

Book.belongsToMany(User, { as: "Favorites", through: "BookXFavorites" });
User.belongsToMany(Book, { as: "Favorites", through: "BookXFavorites" });

Book.belongsToMany(User, { as: "Read", through: "BookXRead" });
User.belongsToMany(Book, { as: "Read", through: "BookXRead" });

Book.belongsToMany(User, { as: "Reading", through: "BookXReading" });
User.belongsToMany(Book, { as: "Reading", through: "BookXReading" });

Book.hasMany(Review);
Review.belongsTo(Book, { through: "BookXReview" });
User.hasMany(Review);
Review.belongsTo(User, { through: "BookXReview" });

User.hasOne(Subscription, { through: "UserXSuscription" });
Subscription.belongsTo(User, { through: "UserXSuscription" });

module.exports = {
  ...sequelize.models, // para poder importar los modelos así: const { Product, User } = require('./db.js');
  conn: sequelize, // para importart la conexión { conn } = require('./db.js');
};
