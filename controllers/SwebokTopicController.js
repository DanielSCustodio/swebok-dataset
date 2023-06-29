const SwebokTopic = require('../models/SwebokTopic');
const IndustryIssue = require('../models/IndustryIssue');
const SwebokChapter = require('../models/SwebokChapter');

module.exports = class SwebokTopicController {
  static async createSwebokTopicSave(req, res) {
    const { SwebokChapterId, Description } = req.body;

    const topic = {
      SwebokChapterId,
      Description,
    };

    await SwebokTopic.create(topic);
    res.redirect(`/swebokchapter/${SwebokChapterId}`);
  }

  static async viewSwebokTopic(req, res) {
    const { id } = req.params;

    const topic = await SwebokTopic.findOne({
      include: IndustryIssue,
      where: { id: id },
    });

    const chapter = await SwebokChapter.findOne({
      raw: true,
      where: { id: topic.SwebokChapterId },
    });
    res.render('sweboktopic/details', {
      topic: topic.get({ plain: true }),
      chapter: chapter,
    });
  }
};
