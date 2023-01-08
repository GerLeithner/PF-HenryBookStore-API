const { User, Book, Review, Subscription } = require("../db");
const { transporter } = require("../config/mailer");

async function registerUser(userName, email) {
  try {
    const user = await User.findOrCreate({
      where: { email },
      defaults: { userName },
      include: [
        "Favorites",
        "Read",
        "Reading",
        Subscription,
        { model: Review, include: [{ model: Book, attributes: ["title"] }] },
      ],
    });

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
        Subscription,
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
        Subscription,
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
        Subscription,
        { model: Review, include: [{ model: Book, attributes: ["title"] }] },
      ],
    });
  } catch (e) {
    throw Error(e.message);
  }
}

async function editUser(
  id,
  userName,
  email,
  password,
  admin,
  profilePic,
  notifications
) {
  try {
    let user = await User.findByPk(id);

    if(notifications) {
      if(notifications.expDate && notifications.newBooks) {
        notifications.all = true;
      }
      if(!notifications.expDate && !notifications.newBooks) {
        notifications.all = false;
      }
    }

    user.update({
      userName,
      email,
      password,
      admin,
      profilePic,
      notifications,
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

async function activateSubscription(id, plan) {
  let finishDate;
  let currentDate = new Date();

  console.log("plan:", plan);

  switch (plan) {
    case "One month":
      finishDate = currentDate.setMonth(currentDate.getMonth() + 1);
      break;
    case "Six months":
      finishDate = currentDate.setMonth(currentDate.getMonth() + 6);
      break;
    case "One year":
      finishDate = currentDate.setMonth(currentDate.getMonth() + 12);
      break;
    default:
      break;
  }

  console.log(
    "Función de mes: ",
    currentDate.setMonth(currentDate.getMonth() + 1)
  );
  console.log("finishDate: ", finishDate);

  const subscription = {
    plan,
    startDate: new Date(),
    finishDate,
  };
  try {
    let user = await User.findByPk(id);
    if (user.subscription) {
      await user.subscription.update(subscription);
    } else {
      let newSubscription = await Subscription.create(subscription);
      user.setSubscription(newSubscription.id);
    }
  } catch (e) {
    console.log(e);
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
  activateSubscription,
};
