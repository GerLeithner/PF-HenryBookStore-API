const { DataTypes } = require("sequelize");

// *id
// *email
// *password
//  full_name
//  billing_address
//  country
// *subscribed   - booleano (esta suscrito o no)
// *status -   booleano (esta dado de alta o no)
// *admin - booleano (es o no admin)

module.exports = (sequelize) => {
  sequelize.define(
    "user",
    {
      id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
      },
      userName: {
        type: DataTypes.STRING,
        allowNull: false,
        uniquie: true,
      },
      email: {
        type: DataTypes.STRING,
        allowNull: false,
        uniquie: true,
      },
      profilePic: {
        type: DataTypes.STRING,
        defaultValue:
          "https://firebasestorage.googleapis.com/v0/b/henry-book-explorer.appspot.com/o/image?alt=media&token=3dccc098-e2c1-48ab-9539-ce0024b12996",
      },
      active: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: true,
      },
      banned: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
      },
      admin: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: false,
      },
      firstLogin: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: true,
      },
      notifications: {
        type: DataTypes.JSON,
        defaultValue: { all: true, expDate: true, newBooks: true },
      },
      googleUser: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
      },
    },
    { timestamps: false }
  );
};
