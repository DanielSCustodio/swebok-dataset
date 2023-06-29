const { DataTypes } = require('sequelize');
const db = require('../db/connection');

const SwebokChapter = db.define('Swebok_Chapter', {
  Description: {
    type: DataTypes.STRING(100),
    allowNull: false,
    require: true,
  },
});

module.exports = SwebokChapter;
