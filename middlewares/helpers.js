const SwebokChpater = require("../models/SwebokChapter");
const SwebokTopic = require("../models/SwebokTopic");

module.exports.checkTopic = async function (req, res, next) {
  const { chapterSelect, topicSelect } = req.body;
  let alert = false;

  const chapter = await SwebokChpater.findAll({ raw: true });
  const topic = await SwebokTopic.findAll({ raw: true });

  const chapterSelected = await SwebokChpater.findOne({
    raw: true,
    where: { Description: chapterSelect },
  });

  const topicSelected = await SwebokTopic.findOne({
    raw: true,
    where: { Description: topicSelect },
  });

  if (topicSelected.SwebokChapterId !== chapterSelected.id) {
    alert = true;
    return res.render("industryissue/create", { alert, chapter, topic });
  }
  next();
};
