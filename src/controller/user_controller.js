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
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function getUserById(id) {
  try {
    return await User.findByPk(id, {
      include: ["Favorites", "Read", "Reading", Review],
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function getAllUsers() {
  try {
    return User.findAll({
      //include: [{ Book }, { Review }, { Subscription }, { Read }],
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function editUser(id, userName, email, password, admin) {
  try {
    let user = await User.findByPk(id);
    user.Update({
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
    if (user.status) {
      user.Update({
        status: false,
      });
    } else {
      user.Update({
        status: true,
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
};
