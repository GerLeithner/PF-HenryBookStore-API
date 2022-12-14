const { DataTypes } = require('sequelize');

// *id
// *title
// *release_date
// *subject    
// *publisher
// description  
// google_rating  
// users_rating

module.exports = (sequelize) => {
    sequelize.define("author", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true
        },
        title: {
            type: DataTypes.STRING,
            allowNull: false
        },
        releasDate: {
            type: DataTypes.INTEGER,
            allowNull: false
        },
        subject: {
            type: DataTypes.STRING,
            allowNull: false
        },
        publisher: {
            type: DataTypes.STRING,
            allowNull: false
        },
        description: {
            type: DataTypes.TEXT,
        },
        googleRating: {
            type: DataTypes.INTEGER
        },
        userRating: {
            type: DataTypes.INTEGER
        },
    }, 
    { timestamps: false });
}