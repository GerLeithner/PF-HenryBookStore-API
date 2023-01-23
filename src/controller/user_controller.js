const { User, Book, Review, Subscription } = require("../db");
const transporter = require("../config/mailer");
const { DataTypes } = require("sequelize");

async function registerUser(userName, email, googleUser) {
  try {
    const user = await User.findOrCreate({
      where: { email },
      defaults: { userName, googleUser },
      include: [
        "Favorites",
        "Read",
        "Reading",
        Subscription,
        { model: Review, include: [{ model: Book, attributes: ["title"] }] },
      ],
    });

    if (user[0].firstLogin) {
      await transporter.sendMail({
        from: '"Henry Books" <henrybookexplorer@gmail.com>', // sender address
        to: user[0].email, // list of receivers
        subject: `Welcome to Henry Book Explorer`, // Subject line
        html: `<b>Hi, ${user[0].userName}! <p>Welcome to Henry Book Explorer!</p><p> We can't wait for you to see our catalogue.</p> <p> Remember to subscribe to be able to read them!</p></b>`, // html body
      });
      await user[0].update({
        firstLogin: false,
      });
    }

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
  notifications,
  active,
  banned
) {
  try {
    let user = await User.findByPk(id);

    if (notifications) {
      if (notifications.expDate && notifications.newBooks) {
        notifications.all = true;
      }
      if (!notifications.expDate && !notifications.newBooks) {
        notifications.all = false;
      }
    }

    if (active !== null && active !== user.active) {
      if (active === false) {
        await transporter.sendMail({
          from: '"Henry Books" <henrybookexplorer@gmail.com>', // sender address
          to: user.email, // list of receivers
          subject: `Accout Disabled`, // Subject line
          html: `<b>Hi, ${user.userName}! <p>Your account has been disabled.</p><p> You can always log back to reactivate your account.</p> <p> We hope to see you back soon!</p></b>`, // html body
        });
      } else {
        if (active === true) {
          await transporter.sendMail({
            from: '"Henry Books" <henrybookexplorer@gmail.com>', // sender address
            to: user.email, // list of receivers
            subject: `Accout Restored`, // Subject line
            html: `<b>Hi, ${user.userName}! <p>Your account has been restored.</p><p> You can now use Henry Books Store as you used to.</p> <p> We are happy to have you back!</p></b>`, // html body
          });
        }
      }
    }

    if (banned !== null && banned !== user.banned) {
      if (banned === true) {
        await transporter.sendMail({
          from: '"Henry Books" <henrybookexplorer@gmail.com>', // sender address
          to: user.email, // list of receivers
          subject: `Accout Banned`, // Subject line
          html: `<b>Hi, ${user.userName}! <p>Your account has been banned by an admin.</p></b>`, // html body
        });
      } else {
        if (banned === false) {
          await transporter.sendMail({
            from: '"Henry Books" <henrybookexplorer@gmail.com>', // sender address
            to: user.email, // list of receivers
            subject: `Accout Restored`, // Subject line
            html: `<b>Hi, ${user.userName}! <p>Your account has been restored.</p><p> You can now use Henry Books Store as you used to.</p> <p> We are happy to have you back!</p></b>`, // html body
          });
        }
      }
    }

    user.update({
      userName,
      email,
      password,
      admin,
      profilePic,
      notifications,
      active,
      banned,
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

    if (user.notifications.expDate && user.notifications.all) {
      await transporter.sendMail({
        from: '"Henry Books " <henrybookexplorer@gmail.com>', // sender address
        to: user.email, // list of receivers
        subject: `Subscription Started`, // Subject line
        html: `<b><p>Hi, ${user.userName}!</p><p> Your subscription has began, congratulations!</p> <p>We are sure you will enjoy reading all our catalogue</p></b>`, // html body
      });
    }
  } catch (e) {
    console.log(e);
    throw Error(e.message);
  }
}

async function checkUsersSubscriptions() {
  let users = await getAllUsers();
  let currentDate = new Date().toISOString().split("T")[0];

  try {
    users.forEach(async (user) => {
      if (user.subscription && currentDate > user.subscription.finishDate) {
        let subscription = await Subscription.findByPk(user.subscription.id);
        subscription.destroy();
        if (user.notifications.expDate && user.notifications.all) {
          await transporter.sendMail({
            from: '"Henry Books 👻" <henrybookexplorer@gmail.com>', // sender address
            to: user.email, // list of receivers
            subject: `Subscription Expired`, // Subject line
            html: `<b><p>Hi, ${user.userName}!</p><p> Your subscription has expired.</p><p> Please renew the subscription to continue reading our books</p></b>`, // html body
          });
        }
      }
    });
  } catch (e) {
    throw Error(e);
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
  checkUsersSubscriptions,
};
