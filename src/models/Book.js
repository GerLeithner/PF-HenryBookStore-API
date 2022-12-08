const { DataTypes } = require('sequelize');

// *id
// *title
// *release_date 
// *publisher
// description  
// google_rating  
// users_rating

module.exports = (sequelize) => {
    sequelize.define("book", {
        id: {
            type: DataTypes.UUID,
            defaultValue: DataTypes.UUIDV4,
            primaryKey: true
        },
        title: {
            type: DataTypes.STRING,
            allowNull: false
        },
        releaseDate: {
            type: DataTypes.INTEGER,
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
        averageRating: {
            type: DataTypes.INTEGER
        },
        cover: {
            type: DataTypes.STRING
        },
        industryIdentifier: {
            type: DataTypes.STRING
        }
    }, 
    { timestamps: false });
}