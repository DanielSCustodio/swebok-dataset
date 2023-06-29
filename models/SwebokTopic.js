const { DataTypes } = require('sequelize');
const db = require('../db/connection');
const SwebokChapter = require('./SwebokChapter');

const SwebokTopic = db.define('Swebok_Topic', {
  Description: {
    type: DataTypes.STRING(100),
    allowNull: false,
    require: true,
  },
});

SwebokTopic.belongsTo(SwebokChapter);
SwebokChapter.hasMany(SwebokTopic);

module.exports = SwebokTopic;
