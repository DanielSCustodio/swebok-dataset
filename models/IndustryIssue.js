const { DataTypes } = require('sequelize');
const db = require('../db/connection');
const SwebokTopic = require('./SwebokTopic');
const SwebokChapter = require("./SwebokChapter");

const IndustryIssue = db.define('Industry_Issue', {
  Type: {
    type: DataTypes.STRING(45),
    allowNull: false,
    require: true,
  },
  Question: {
    type: DataTypes.STRING(300),
    allowNull: false,
    require: true,
  },

  Description: {
    type: DataTypes.BLOB,
    require: true,
  },

  File: {
    type: DataTypes.BLOB,
  },

  Claiment: {
    type: DataTypes.STRING(200),
    allowNull: false,
    require: true,
  },

  SwebokChapterId: {
    type: DataTypes.INTEGER,
    allowNull: true,
    foreignKey: true,
    references: { model: 'Swebok_Chapters', key: 'id' },
    onUpdate: 'CASCADE',
    onDelete: 'CASCADE',
  },
});

IndustryIssue.belongsTo(SwebokTopic);
SwebokTopic.hasMany(IndustryIssue);

IndustryIssue.belongsTo(SwebokChapter);
SwebokChapter.hasMany(IndustryIssue);

module.exports = IndustryIssue;
