const { DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  sequelize.define(
    "book",
    {
      id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
      },
      title: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
      },
      subtitle: {
        type: DataTypes.STRING,
      },
      publishedDate: {
        type: DataTypes.STRING,
      },
      publisher: {
        type: DataTypes.STRING,
      },
      description: {
        type: DataTypes.TEXT,
      },
      pages: {
        type: DataTypes.INTEGER,
      },
      averageRating: {
        type: DataTypes.DOUBLE,
      },
      usersRating: {
        type: DataTypes.DOUBLE,
      },
      cover: {
        type: DataTypes.STRING,
      },
      identifier: {
        type: DataTypes.STRING,
      },
      active: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
      },
    },
    { timestamps: false }
  );
};
