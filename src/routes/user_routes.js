const express = require("express");
const { User } = require("../db");
const {
  registerUser,
  getUserById,
  editUser,
  changeUserStatus,
  getAllUsers,
} = require("../controller/user_controller");

const router = express();
router.use(express.json());

router.get("/", async (req, res) => {
  try {
    const users = await getAllUsers();

    if (!users) throw Error("No users has been found");
    else {
      res.status(200).json(users);
    }
  } catch (e) {
    res.status(404).send(e.message);
  }
});

router.get("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    const user = await getUserById(id);

    if (!user) throw Error("No user has been found");
    else {
      res.status(200).json(user);
    }
  } catch (e) {
    res.status(404).send(e.message);
  }
});

router.post("/register", async (req, res) => {
  const { nickname, email } = req.body;

  try {
    const user = await registerUser(nickname, email);
    res.status(200).json(user);
  } catch (e) {
    res.status(400).send(e.message);
  }
});

router.put("/edit", async (req, res) => {
  const { id, userName, email, password, admin, profilePic, notifications } = req.body;
  try {
    await editUser(id, userName, email, password, admin, profilePic, notifications);
    res.status(200).send("User updated succesfully");
  } catch (e) {
    res.status(400).send(e.message);
  }
});

router.put("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    await changeUserStatus(id);

    res.status(200).send("Status changed succesful");
  } catch (e) {
    res.status(400).send(e.message);
  }
});

module.exports = router;
