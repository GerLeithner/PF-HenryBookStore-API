const express = require('express');
const cookieParser = require("cookie-parser");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const routes = require("./routes/index.js");
const { checkUsersSubscriptions } = require("./controller/user_controller");
require("./db.js");

//importar el modulo de cors
const cors = require('cors');
// const { AXIOS_URL } = process.env;



const schedule = require("node-schedule");

const server = express();

server.name = "API";

server.use(cors({
  origin: '*',
  methods: '*',
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
}));

server.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));
server.use(bodyParser.json({ limit: "50mb" }));
server.use(cookieParser());
server.use(morgan("dev"));
server.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*"); // update to match the domain you will make the request from
  res.header("Access-Control-Allow-Credentials", "true");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  res.header("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
  next();
});

server.use("/", routes);

// Error catching endware.
server.use((err, req, res, next) => {
  // eslint-disable-line no-unused-vars
  const status = err.status || 500;
  const message = err.message || err;
  console.error(err);
  res.status(status).send(message);
});

checkUsersSubscriptions();

schedule.scheduleJob("0 0 * * *", () => checkUsersSubscriptions());

module.exports = server;
