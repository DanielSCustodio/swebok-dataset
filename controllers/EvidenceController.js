const Evidence = require('../models/Evidence');
const { Op } = require('sequelize');

module.exports = class EvidenceController {
  static createEvidence(req, res) {
    res.render('evidence/create');
  }

  static async dashboard(req, res) {
    const evidence = await Evidence.findAll({ raw: true });

    res.render('evidence/dashboard', { evidence });
  }

  static async createEvidenceSave(req, res) {
    const {
      Description,
      Title,
      Authors,
      Abstract,
      KeyWords,
      DOINnumber,
      Link,
      File,
    } = req.body;

    const evidence = {
      Title,
      Authors,
      Abstract,
      KeyWords,
      DOINnumber,
      Description,
      Link,
      File,
    };
    await Evidence.create(evidence);
    res.redirect('/evidence');
  }

  static async viewEvidence(req, res) {
    const { id } = req.params;
    const evidence = await Evidence.findOne({
      where: { id: id },
      raw: true,
    });
    res.render('evidence/details', {
      evidence,
    });
  }

  static async editEvidence(req, res) {
    const { id } = req.params;
    const evidence = await Evidence.findOne({ raw: true, where: { id: id } });
    res.render('evidence/edit', { evidence });
  }

  static async updateEvidenceSave(req, res) {
    const {
      id,
      Description,
      Title,
      Authors,
      Abstract,
      KeyWords,
      DOINnumber,
      Link,
      File,
    } = req.body;

    const evidence = {
      id,
      Description,
      Title,
      Authors,
      Abstract,
      KeyWords,
      DOINnumber,
      Link,
      File,
    };

    await Evidence.update(evidence, { where: { id: id } });
    res.redirect('/evidence');
  }

  static async searchEvidence(req, res) {
    const { search } = req.body;
    const all = true;
    const evidence = await Evidence.findAll({
      raw: true,
      where: {
        Title: {
          [Op.like]: `%${search}%`,
        },
      },
    });
    res.render('evidence/dashboard', { evidence, all });
  }
};
