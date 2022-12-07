const { DataTypes } = require('sequelize');


module.exports = (sequelize) => {
    sequelize.define("read", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true
        },
        read: {
            type: DataTypes.BOOLEAN,
            defaultValue: false,
            allowNull: false
        }
    }) 
}