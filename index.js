const server = require("./src/app.js");
const { conn } = require("./src/db.js");
const port=process.PORT || 3001;

conn.sync({ force: false }).then(() => {
  server.listen(port, () => {
    console.log(`Server raised in port ${port}`);
  });
});
