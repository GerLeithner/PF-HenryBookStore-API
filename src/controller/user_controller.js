const { User, Book } = require("../db");

async function registerUser(userName, email, password, admin) {
  try {
    await User.findOrCreate({
      where: { email },
      defaults: { userName, password, admin },
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function getUserById(id) {
  try {
    return await User.findByPk(id, {
      include: [{ Book }, { Review }, { Subscription }, { Read }],
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function getAllUsers() {
  try {
    return User.findAll({
      include: [{ Book }, { Review }, { Subscription }, { Read }],
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

async function deleteUser(id) {
  try {
    await User.destroy({
      where: id,
    });
  } catch (e) {
    throw Error(e.message);
  }
}

module.exports = {
  registerUser,
  getUserById,
  editUser,
  deleteUser,
  changeUserStatus,
  getAllUsers,
};
