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

async function editUser(id, userName, email, password, admin, status) {
  try {
    let user = await UserFindByPk(id);
    user.Update({
      userName,
      email,
      password,
      admin,
      status,
    });
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
};
