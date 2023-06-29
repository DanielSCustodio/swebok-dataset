const SwebokChapter = require('../models/SwebokChapter');
const SwebokTopic = require('../models/SwebokTopic');

module.exports = class SwebokChapterController {
  static createSwebokChapter(req, res) {
    res.render('swebokchapter/create');
  }

  static async dashboard(req, res) {
    const chapters = await SwebokChapter.findAll({ raw: true });

    res.render('swebokchapter/dashboard', { chapters });
  }

  static async createSwebokChapterSave(req, res) {
    const response = {
      Description: req.body.chapter,
    };
    await SwebokChapter.create(response);
    res.redirect('/swebokchapter');
  }

  static async viewSwebokChapter(req, res) {
    const { id } = req.params;
    const chapter = await SwebokChapter.findOne({
      include: SwebokTopic,
      where: { id: id },
    });
    res.render('swebokchapter/details', {
      chapter: chapter.get({ plain: true }),
    });
  }
};
