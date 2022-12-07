const { DataTypes } = require('sequelize');

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
    sequelize.define("user", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false
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
        subscribed  : {
            type: DataTypes.BOOLEAN,
            allowNull: false
        },
        status: {
            type: DataTypes.BOOLEAN,
            allowNull: false
        },
        admin: {
            type: DataTypes.BOOLEAN,
            allowNull: false
        }
    }, 
    { timestamps: false });
}