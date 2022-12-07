const { DataTypes } = require('sequelize');


module.exports = (sequelize) => {
    sequelize.define("subscription", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true
        },
        fullname: {
            type: DataTypes.STRING,
            allowNull: false
        },
        billingAdress: {
            type: DataTypes.STRING
        },
        country: {
            type: DataTypes.STRING
        },
        type: {
            type: DataTypes.ENUM("oneMonth","sixMonth","oneYear")
        },
        startDate: {
            type: DataTypes.DATEONLE
        },
        finishDate: {
           type: DataTypes.DATEONLY
        }
    },
    {timestamps: false}) 
    
}