const { DataTypes } = require('sequelize');
const db = require('../db/connection');
const IndustryIssue = require('./IndustryIssue');
const Evidence = require('./Evidence');

const IssueEvidence = db.define('Issue_Evidence', {
  Annotation: {
    type: DataTypes.BLOB,
    require: true,
  },

  File: {
    type: DataTypes.BLOB,
  },

});

IssueEvidence.belongsTo(IndustryIssue);
IndustryIssue.hasMany(IssueEvidence);

IssueEvidence.belongsTo(Evidence);
Evidence.hasMany(IssueEvidence);

module.exports = IssueEvidence;
