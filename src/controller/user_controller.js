const { User, Book, Review } = require("../db");

async function registerUser(userName, email) {
  try {
    const user = await User.findOrCreate({
      where: { email },
      defaults: { userName },
      raw: true,
    });

    console.log(user[0]);

    return user[0];
  } catch (e) {
    throw Error(e.message);
  }
}

async function getUserByEmail(email) {
  try {
    return await User.findOne({
      where: { email },
      include: [
        "Favorites",
        "Read",
        "Reading",
        { model: Review, include: [{ model: Book, attributes: ["title"] }] },
      ],
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function getUserById(id) {
  try {
    return await User.findByPk(id, {
      include: [
        "Favorites",
        "Read",
        "Reading",
        { model: Review, include: [{ model: Book, attributes: ["title"] }] },
      ],
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function getAllUsers() {
  try {
    return User.findAll({
      include: [
        "Favorites",
        "Read",
        "Reading",
        { model: Review, include: [{ model: Book, attributes: ["title"] }] },
      ],
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function editUser(id, userName, email, password, admin) {
  try {
    let user = await User.findByPk(id);
    user.update({
      userName,
      email,
      password,
      admin,
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function changeUserStatus(id) {
  try {
    let user = await User.findByPk(id);
    if (user.active) {
      user.update({
        active: false,
      });
    } else {
      user.update({
        active: true,
      });
    }
  } catch (e) {
    throw Error(e.message);
  }
}

module.exports = {
  registerUser,
  getUserById,
  editUser,
  changeUserStatus,
  getAllUsers,
  getUserByEmail,
};
