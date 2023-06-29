const { DataTypes } = require('sequelize');
const db = require('../db/connection');

const Evidence = db.define('Evidence', {
  Description: {
    type: DataTypes.STRING(100),
    allowNull: false,
    require: true,
  },
  Title: {
    type: DataTypes.STRING(200),
    allowNull: false,
    require: true,
  },
  Authors: {
    type: DataTypes.BLOB,
    require: true,
  },

  Abstract: {
    type: DataTypes.BLOB,
  },

  KeyWords: {
    type: DataTypes.STRING(200),
    require: true,
  },

  DOINnumber: {
    type: DataTypes.STRING(100),
  },

  Link: {
    type: DataTypes.STRING(200),
    require: true,
  },

  File: {
    type: DataTypes.BLOB,
  },
});

module.exports = Evidence;
