const { DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  sequelize.define(
    "subscription",
    {
      id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
      },
      type: {
        type: DataTypes.STRING,
        allowNull: false,
        defaultValue: "male",
        validate: {
          customValidator: (value) => {
            const enums = ["One month", "Six months", "One year"];
            if (!enums.includes(value)) {
              throw new Error("not a valid option");
            }
          },
        },
      },
      startDate: {
        type: DataTypes.DATEONLY,
      },
      finishDate: {
        type: DataTypes.DATEONLY,
      },
      active: {
        type: DataTypes.BOOLEAN,
        defaultValue: false,
      },
    },
    { timestamps: false }
  );
};
