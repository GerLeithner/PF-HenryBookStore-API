const { User, Book } = require("../db");

async function registerUser(email, password, admin) {
  try {
    await User.findOrCreate({
      where: { email },
      defaults: { password, admin },
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function getUserById(id) {
  try {
    await User.findByPk(id, {
      include: Book,
    });
  } catch (e) {
    throw Error(e.message);
  }
}
